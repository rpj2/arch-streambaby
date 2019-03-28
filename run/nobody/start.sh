#!/bin/bash

# check if we have backed up the original streambaby.ini
if [ -f /streambaby-0.54/streambaby.ini.original ]; then
	echo "/streambaby-0.54/streambaby.ini.original exists."
else
	echo "/streambaby-0.54/streambaby.ini.original does not exist."
	# the backed up copy doesn't exist, does the original exist?
	if [ -f /streambaby-0.54/streambaby.ini ]; then
		echo "Moving streambaby.ini to streambaby.ini.original"
		mv /streambaby-0.54/streambaby.ini /streambaby-0.54/streambaby.ini.original
	else
		echo "Creating streambaby.ini default as streambaby.ini.original"
		cat <<EOF>/streambaby-0.54/streambaby.ini.original
#
# ./streambaby --help for more configuration file options
#

dir.1=/path/to/my/videos
dir.1.name=My Videos
#dir.2=/media/disk
#dir.2.name=External Drive
# Ip address to bind to
# most people don't need to change this. 
#ip=192.168.1.37
# port to use
#port=7290
EOF
	fi
fi

# check if /streambaby-0.54/streambaby.ini exists as a file
if [ -f /streambaby-0.54/streambaby.ini ]; then
	echo "Removing /streambaby-0.54/streambaby.ini file."
	rm -f /streambaby-0.54/streambaby.ini
else
	echo "/streambaby-0.54/streambaby.ini does not exist as a file."
fi

# check if streambaby.ini exists, if not copy over default
if [ -f /config/streambaby.ini ]; then
	echo "/config/streambaby.ini exists."
else
	echo "Copying streambaby.ini.original to /config"
	cp /streambaby-0.54/streambaby.ini.original /config/streambaby.ini
fi

# check if we need to link streambaby.ini
if [ -L /streambaby-0.54/streambaby.ini ]; then
	echo "/streambaby-0.54/streambaby.ini link exists."
else
	echo "Linking /config/streambaby.ini"
	ln -s /config/streambaby.ini /streambaby-0.54/streambaby.ini
fi

# check if we need to create /config/streambaby.log
if [ -f /config/streambaby.log ]; then
	echo "/config/streambaby.log exists."
else
	echo "Creating /config/streambaby.log"
	touch /config/streambaby.log
fi

# check if we need to link streambaby.log
if [ -L /streambaby-0.54/streambaby.log ]; then
	echo "/streambaby-0.54/streambaby.log link exists."
else
	echo "Linking /config/streambaby.log"
	ln -s /config/streambaby.log /streambaby-0.54/streambaby.log
fi

# check if we have backed up the original simplelog.properties
if [ -f /streambaby-0.54/simplelog.properties.original ]; then
	echo "/streambaby-0.54/simplelog.properties.original already exists."
else
	echo "/streambaby-0.54/simplelog.properties.original does not exist."
	# backed up copy doesn't exist, does the original exist?
	if [ -f /streambaby-0.54/simplelog.properties ]; then
		echo "Moving simplelog.properties to simplelog.properties.original"
		mv /streambaby-0.54/simplelog.properties /streambaby-0.54/simplelog.properties.original
	else
		echo "Creating simplelog.properties default as simplelog.properties.original"
		cat <<EOF>/streambaby-0.54/simplelog.properties.original
com.unwiredappeal=Info
com.tivo=Warn

# Uncomment below to send logging to streambaby.log.  By default, it will overwrite prev. log. Set simpelog.logFile.append=true (below) to append
simplelog.logFile=streambaby.log

# these only apply if we are logging to a file...
simplelog.logFile.append=false
simplelog.logFile.andConsole=true
# formatting options
simplelog.dateFormat=MM/dd/yy kk:mm:ss
simplelog.format.debug={0} {2}: {5}
# should we reload this file if it is changed?
#simplelog.reloading=true
EOF
	fi
fi

# check if /streambaby-0.54/simplelog.properties exists as a file
if [ -f /streambaby-0.54/simplelog.properties ]; then
	echo "Removing /streambaby-0.54/simplelog.properties file."
	rm -f /streambaby-0.54/simplelog.properties
else
	echo "/streambaby-0.54/simplelog.properties does not exist as a file."
fi

# check if streambaby.ini exists, if not copy over default
if [ -f /config/simplelog.properties ]; then
	echo "/config/simplelog.properties exists."
else
	echo "Copying simplelog.properties.original to /config"
	cp /streambaby-0.54/simplelog.properties.original /config/simplelog.properties
fi

if [ -L /streambaby-0.54/simplelog.properties ]; then
	echo "/streambaby-0.54/simplelog.properties link exists."
else
	echo "Linking /config/simplelog.properties"
	ln -s /config/simplelog.properties /streambaby-0.54/simplelog.properties
fi

# check if cache directory exists and needs to be removed
if [ -d /streambaby-0.54/cache ]; then
	echo "Removing /streambaby-0.54/cache directory."
	rm -rf /streambaby-0.54/cache
else
	echo "/streambaby-0.54/cache does not exist as a directory."
fi

# check if we need to link cache directory
if [ -L /streambaby-0.54/cache ]; then
	echo "/streambaby-0.54/cache link exists."
else
	echo "Linking /cache"
	ln -s /cache /streambaby-0.54/cache
fi

# finally, start it up
/streambaby-0.54/streambaby
