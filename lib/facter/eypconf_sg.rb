if File.exists?('/opt/eypconf/id/sg.sh') then
  sg = Facter::Util::Resolution.exec('bash /opt/eypconf/id/sg.sh').to_s
else
  sg = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/sg ]; then cat /opt/eypconf/id/server; fi\'')
end

unless sg.nil? or sg.empty?
  Facter.add('eypconf_sg') do
      setcode do
        sg
      end
  end

  Facter.add('eypconf_sg_uppercase') do
      setcode do
        sg.upcase
      end
  end

  Facter.add('eypconf_sg_lowercase') do
      setcode do
        sg.downcase
      end
  end
end
