#!/bin/sh
#
# muonato/check_tomcat.sh @ GitHub (22-MAY-2024)
#
# Tomcat server status check by reading last log entry.
# Compatible with Nagios monitoring as host plugin.
#
# Usage:
#       bash check_tomcat.sh </path/to/log>
#
#       Nagios nrpe configuration on host :
#       command[check_tomcat]=sudo /path/to/plugins/check_tomcat.sh $ARG1$
#
#       Sudoers drop-in for user 'nagios' /etc/sudoers.d/nagios :
#       nagios ALL=NOPASSWD:/usr/local/nagios/libexec/check_tomcat.sh
#
#       Opsview monitor configuration :
#       check_nrpe -H $HOSTADDRESS$ -c check_tomcat -a '/opt/tomcat/tomcat9/logs/catalina.out'
#
# Parameters:
#       1: tomcat log file
#
LOG_FILE=${1?"ERROR: missing parameter"}
LAST_MSG=$(sudo tail -1 $LOG_FILE 2>/dev/null)

# Expecting 'Server startup' in last log entry when healthy
if [[ -z $(echo $LAST_MSG|grep -o "Server startup") ]]; then
    echo "CRITICAL - Error log: $LOG_FILE"
    exit 2
else
    echo "OK - $LAST_MSG"
    exit 0
fi
