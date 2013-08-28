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

  $username = 'root'

  class { 'cron': }

  class { 'puppet': }

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

}



