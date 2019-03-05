if File.exists?('/opt/eypconf/id/customer.sh') then
  customer = Facter::Util::Resolution.exec('bash /opt/eypconf/id/customer.sh').to_s
else
  customer = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/customer ]; then cat /opt/eypconf/id/customer | paste -sd,; fi\'').to_s
end

unless customer.nil? or customer.empty?
  Facter.add('eypconf_customer') do
      setcode do
        customer
      end
  end

  Facter.add('eypconf_customer_uppercase') do
      setcode do
        customer.upcase
      end
  end

  Facter.add('eypconf_customer_lowercase') do
      setcode do
        customer.downcase
      end
  end
end
