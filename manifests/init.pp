class duplicity (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'duplicity',
  }

  package { $required: ensure => $ensure }

}
