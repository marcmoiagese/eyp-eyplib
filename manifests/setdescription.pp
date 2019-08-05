class eyplib::setdescription(
                              $description = undef
                            ) {
  if($description!=undef)
  {
    file { '/opt/eypconf/id/description':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $description,
    }
  }
}
