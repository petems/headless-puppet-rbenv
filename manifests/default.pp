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
    logoutput=>on_failure
  }

  class { 'cron': }

  class { 'puppet': }

  exec {'create-ruby-user':
    command => 'id -u rubyuser &>/dev/null || /usr/sbin/useradd rubyuser'
  }

  $username = 'rubyuser'
  $home_dir = "/home/${username}"

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



