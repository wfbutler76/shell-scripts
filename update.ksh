#!/usr/bin/ksh93
###############################################################################################
#### A simple debian base full system update script.
#### This will fix any broke or missing dependencies, update package list, upgrade packages,
#### upgrade dependencies, then it will run a full clean up!
#### This program needs to be ran as sudo after script is complete it drops sudo privileges!
###############################################################################################

function displaymsg {
  print "
Program: update
Author: William Butler
License: GNU GPL (version 3, or any later version).
"
}

function update {
  apt-get install -f
  apt-get update -y
  apt-get upgrade -y
  apt-get dist-upgrade -y
  apt-get autoclean
  apt-get autoremove -y
  apt-get clean
}

function drop_sudo {
	sudo -k
}

update

drop_sudo

displaymsg

# Exit
exit ${?}
