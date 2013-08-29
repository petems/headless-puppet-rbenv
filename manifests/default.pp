# == Class: default
#
#  Defines the default node
#
# === Parameters
#
#
#
# === Variables
#
#
# === Examples
#
# include default
#
# === Authors
#
# PeteMS
#
node default {

  Exec {
    path=>'/usr/bin:/bin',
    logoutput=>on_failure
  }

  class { 'cron': }

  class { 'puppet': }

  $username = 'root'

  if $username == 'root' {
    $home_dir    = "/root"
  }
  else {
    $home_dir    = "/home/${username}"
  }

  rbenv::install { $username:
    group => $username,
    user  => $username,
    home  => $home_dir,
  }

  rbenv::compile { '1.9.3-p327':
    user   => $username,
    home   => $home_dir,
    global => true,
  }

}



