# check_tomcat
Nagios monitoring compatible Tomcat server health check.

Monitoring server process alone may not reveal underlying Tomcat failure.
Script reads the last line in Tomcat server log to detect 'Server startup' for healthy condition.

## Usage
```
check_tomcat.sh </path/to/log>
```

## Nagios monitoring setup
Specify command in your nrpe configuration (drop-in) file on host

```
command[check_tomcat]=sudo /path/to/plugins/check_tomcat.sh $ARG1$
```

Set command on your nagios monitoring server

```
check_nrpe -H $HOSTADDRESS$ -c check_tomcat -a '/path/to/log'
```

## Examples
Nagios monitoring test

```
$ /usr/local/nagios/libexec/check_nrpe -H foobar.server.com -c check_tomcat -a '/opt/tomcat/tomcat9/logs/catalina.out'
RETURN CODE: 0 (OK)
OUTPUT:
 OK - 22-May-2024 11:50:59.272 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [4440] milliseconds
```

## Platform
Script development and testing
```
GNU bash, version 4.2.46(2)-release (x86_64-redhat-linux-gnu)
CentOS Linux release 7.9.2009 (Core)
OpenSSL 1.0.2k-fips 26 Jan 2017
Opsview Core 3.20140409.0
```
