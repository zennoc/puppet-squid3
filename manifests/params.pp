# Class: squid3::params
#
# This class defines default parameters used by the main module class squid3
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to squid3 class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class squid3::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'squid3',
  }

  $service = $::operatingsystem ? {
    default => 'squid3',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'squid3',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'proxy',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/squid3',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/squid3/squid.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/squid3',
    default                   => '/etc/sysconfig/squid3',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/squid3.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/squid3',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/squid3',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/squid3/cache.log',
  }

  $port = '3128'
  $protocol = 'tcp'

  $include_dir = '/etc/squid3/squid-conf.d'
  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
