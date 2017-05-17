magichash = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/.magic ]; then cat /opt/eypconf/id/.magic | paste -sd,; else echo "deadbeef"; fi\'').to_s

unless magichash.nil? or magichash.empty?
  Facter.add('eypconf_magic_hash') do
      setcode do
        magichash
      end
  end
end
