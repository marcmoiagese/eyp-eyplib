# == Class: eyplib
#
# === eyplib documentation
#
class eyplib {
  exec { 'mkdir -p /opt/eypconf/id':
    command => 'mkdir -p /opt/eypconf/id',
    path    => '/usr/sbin:/usr/bin:/sbin:/bin',
    creates => '/opt/eypconf/id',
  }
}
