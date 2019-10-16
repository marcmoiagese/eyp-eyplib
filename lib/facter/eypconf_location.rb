if File.exists?('/opt/eypconf/id/description.sh') then
  description = Facter::Util::Resolution.exec('bash /opt/eypconf/id/description.sh').to_s
else
  description = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/description ]; then cat /opt/eypconf/id/description | paste -sd,; fi\'').to_s
end

unless description.nil? or description.empty?
  Facter.add('eypconf_description') do
      setcode do
        description
      end
  end

end
