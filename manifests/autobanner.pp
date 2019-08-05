class eyplib::autobanner(
                          $autobanner_file               = '/opt/eypconf/autobanner',
                          $include_legal                 = false,
                          $include_description           = true,
                          $include_puppet_managed_server = true,
                        ) {
  file { $autobanner_file:
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/autobanner.erb"),
  }
}
