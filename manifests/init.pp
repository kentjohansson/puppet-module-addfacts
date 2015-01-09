# == Class: addfacts
#
# Manage addfacts
#
class addfacts (
  $facts_d_dir        = '/etc/facter/facts.d',
  $customized_facts   = false,
  $facts_f_name       = 'default',
  $facts_f_owner      = 'root',
  $facts_f_group      = 'root',
  $facts_f_mode       = '0755',
  $facts_hash         = {},
) {

  if $customized_facts == true {
    file { 'customized_facts_file':
	  ensure  => 'present',
	  path    => "$facts_d_dir/$facts_f_name",
	  owner   => $facts_f_owner,
    group   => $facts_f_group,
    mode    => $facts_f_mode,
	  content => template('addfacts/fact.erb'),
    }
  }
}
