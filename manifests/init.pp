# Class: drush
#
# This class installs prerequisite packages and Drush. Supported on Debian
# based systems. Module should be installed on the Puppet modules path.
#
# == Requires:
#
#   Packages: git, php5-cli, php-pear
#   Pear Resources: Console_Table (prerequisite for Drush)
#
# == Variables:
#
#   Inherits $branch_name from drush::params
#
# == Examples
#
#   class {'drush': }
#   include drush
#
# == Authors
#
#   James Clemence <james+github@jvc26.org>
#
class drush {

    include drush::params

    package { 'Console_Table':
        ensure   => present,
        provider => pear,
        require  => [Package['php-pear'],Exec["discover-drush-channel"]],
    }
    package { 'drush/drush':
        ensure   => present,
        provider => pear,
        require  => [Package['Console_Table'], Exec["discover-drush-channel"]],
    }
    exec {"discover-drush-channel" :
      command => 'pear channel-discover pear.drush.org',
      path => "/bin:/usr/bin:/usr/sbin",
      unless => "locate /usr/share/pear/drush/drush.php",
    }
    


    
}
