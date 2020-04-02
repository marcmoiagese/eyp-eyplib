Puppet::Type.newtype(:download) do
  @doc = 'download files'

  newparam(:name) do
    desc "An arbitrary tag for your own reference"
    isnamevar
  end

  newproperty(:url) do
    desc 'URL to download'

    defaultto { @resource[:name] }

    # If needing to run the SQL command, return a fake value that will trigger
    # a sync, else return the expected SQL command so no sync takes place
    def retrieve
      if @resource.should_run_wget
        return :notrun
      else
        return self.should
      end
    end

    def sync
      output, status = provider.run_wget_command(value)
      self.fail("Error executing curl; returned #{status}: '#{output}'") unless status == 0
    end
  end

  newparam(:cwd, :parent => Puppet::Parameter::Path) do
    desc "The working directory under which the wget command should be executed."
    defaultto("/tmp")
  end

  newparam(:creates) do
    desc "file created"

    def matches(value)
      provider.check_created_file(value)
    end
  end

  newparam(:refreshonly, :boolean => true) do
    desc "If 'true', it will only be executed via a notify/subscribe event."

    defaultto(:false)
    newvalues(:true, :false)
  end

  def should_run_wget(refreshing = false)
    creates_param = @parameters[:creates]
    return false if !creates_param.nil? && !creates_param.value.nil? && creates_param.matches(creates_param.value)
    return false if !refreshing && @parameters[:refreshonly].value == :true
    true
  end

  def refresh
    self.property(:command).sync if self.should_run_wget(true)
  end

end
