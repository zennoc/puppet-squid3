# Puppet module: squid3

This is a Puppet module for squid3 based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Nathan Flynn / Zen Internet LTD

Official site: http://www.example42.com

Official git repository: http://github.com/zennoc/puppet-squid3

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install squid3 with default settings

        class { 'squid3': }

* Install a specific version of squid3 package

        class { 'squid3':
          version => '1.0.1',
        }

* Disable squid3 service.

        class { 'squid3':
          disable => true
        }

* Remove squid3 package

        class { 'squid3':
          absent => true
        }

* Enable auditing without without making changes on existing squid3 configuration *files*

        class { 'squid3':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'squid3':
          noops => true
        }

* Adds or configures a squid ACL

		Usage:
		  squid3::acl { 'safe_ports':
		    acl_type => 'port',
		    acl_data => '80 443 8080 9418'
		  }

* Adds or configures a squid http_access rules

		 Usage:
		  squid3::http_access { 'allow_zen_hosts':
		    order      => '10',
		    acl_access => 'allow',
		    acl_data   => 'zen_hosts'
		  }

## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'squid3':
          source => [ "puppet:///modules/example42/squid3/squid3.conf-${hostname}" , "puppet:///modules/example42/squid3/squid3.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'squid3':
          source_dir       => 'puppet:///modules/example42/squid3/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'squid3':
          template => 'example42/squid3/squid3.conf.erb',
        }

* Automatically include a custom subclass

        class { 'squid3':
          my_class => 'example42::my_squid3',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'squid3':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'squid3':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'squid3':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'squid3':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/example42/puppet-squid3.png?branch=master" alt="Build Status" />}[https://travis-ci.org/example42/puppet-squid3]
