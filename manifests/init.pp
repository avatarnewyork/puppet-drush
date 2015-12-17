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

  exec {"install_drush" :
    command => 'wget -O /usr/bin/drush http://files.drush.org/drush.phar; chmod 755 /usr/bin/drush',
    path => "/bin:/usr/bin:/usr/sbin",
    unless => "locate /usr/bin/drush",
  }

}
