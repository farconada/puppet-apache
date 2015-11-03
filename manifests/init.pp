class apache (
	String $confd_source = ''
	) {

	if $operatingsystem =~  /(?i-mx:centos|fedora|redhat)/ {
		$servicename = 'httpd'
	}
	
        if $operatingsystem =~  /(?i-mx:ubuntu|debian)/  {
	    	$servicename = 'apache2'
	}

	package {$servicename:
		ensure => latest;
	}

	if $confd_source != '' {
		file {"/etc/$servicename/conf.d":
		    ensure 	=> directory,
		    source 	=> $confd_source,
		    require 	=> Package[$servicename],
		}	
	}

}
