define duplicity::job (
  $source = '',
  $destination = '',
  $options = '',
  $runas = '',
  $minute = '',
  $hour = '*',
  $monthday = '*',
  $month = '*',
  $weekday = '*'
) {
  file { "/usr/bin/job-${name}.sh":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('duplicity/job.erb'),
  }

  cron { "duplicity-${name}":
    ensure   => present,
    command  => "/usr/bin/job-${name}.sh > /dev/null 2>&1",
    user     => ${runas},
    minute   => ${minute},
    hour     => ${hour},
    monthday => ${monthday},
    month    => ${month},
    weekday  => ${weekday},
  }

}