userid = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/customer ]; then cat /opt/eypconf/id/customer | paste -sd,; else echo "defaultcustomer"; fi\'').to_s

unless userid.nil? or userid.empty?
  Facter.add('eypconf_userid') do
      setcode do
        userid
      end
  end

  Facter.add('eypconf_userid_uppercase') do
      setcode do
        userid.upcase
      end
  end

  Facter.add('eypconf_userid_lowercase') do
      setcode do
        userid.downcase
      end
  end
end
