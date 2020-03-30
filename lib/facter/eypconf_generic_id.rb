Dir.entries("/etc/eypconf/id").select {|f| !File.directory? f}.each do |i|

  genetic_id = Facter::Util::Resolution.exec("bash -c 'cat /etc/eypconf/id/#{i}'").to_s

  unless genetic_id.nil? or genetic_id.empty?
    Facter.add("eypconf_#{i}") do
        setcode do
          genetic_id
        end
    end

    Facter.add("eypconf_#{i}|_uppercase") do
        setcode do
          genetic_id.upcase
        end
    end

    Facter.add("eypconf_#{i}_lowercase") do
        setcode do
          genetic_id.downcase
        end
    end

    Facter.add("eypconf_#{i}_source") do
        setcode do
          i
        end
    end
  end

end
