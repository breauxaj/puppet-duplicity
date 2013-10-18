class duplicity {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'duplicity',
  }

  package { $required: ensure => latest }

}
