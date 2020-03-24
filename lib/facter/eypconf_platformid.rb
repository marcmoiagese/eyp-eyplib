if File.exists?('/opt/eypconf/id/platformid.sh') then
  platformid = Facter::Util::Resolution.exec('bash /opt/eypconf/id/platformid.sh').to_s
else
  platformid = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/platformid ]; then cat /opt/eypconf/id/platformid | paste -sd,; fi\'').to_s
end

unless platformid.nil? or platformid.empty?
  Facter.add('eypconf_platformid') do
      setcode do
        platformid
      end
  end

  Facter.add('eypconf_platformid_uppercase') do
      setcode do
        platformid.upcase
      end
  end

  Facter.add('eypconf_platformid_lowercase') do
      setcode do
        platformid.downcase
      end
  end
end
