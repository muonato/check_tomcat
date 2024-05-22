# check_tomcat
Nagios monitoring compatible Tomcat server health check

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
Check certificate expiry date

```
$ ./check_tomcat.sh /etc/pki/tls/ca/server.pem
1: CRITICAL - Certificate '/etc/pki/tls/server.pem' expiry '2023-12-31' (in 22 days)
```

## Platform
Script development and testing
```
GNU bash, version 4.2.46(2)-release (x86_64-redhat-linux-gnu)
CentOS Linux release 7.9.2009 (Core)
OpenSSL 1.0.2k-fips 26 Jan 2017
Opsview Core 3.20140409.0
```
