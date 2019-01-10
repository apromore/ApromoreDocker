#!/bin/bash

# make sure we have JAVA_HOME set
if [ -z "$JAVA_HOME" ]
then
echo The JAVA_HOME environment variable is not defined. Using PATH instead.
fi

CLASSPATH=
FWCLASSPATH=

#  Create the classpath for bootstrapping the Server from all the JARs in lib
for file in $KERNEL_HOME/lib/*
do
if [[ $file == *.jar ]]
then
CLASSPATH=$CLASSPATH:$KERNEL_HOME/lib/${file##*/}
FWCLASSPATH=$FWCLASSPATH,file:$KERNEL_HOME/lib/${file##*/}
fi
done

#  Append the osgi jar to the classpath
for file in $KERNEL_HOME/plugins/org.eclipse.osgi_*.jar
do
CLASSPATH=$CLASSPATH:$KERNEL_HOME/plugins/${file##*/}
FWCLASSPATH=$FWCLASSPATH,file:$KERNEL_HOME/plugins/${file##*/}
done

#  Append the console.supportability jar to the classpath to enable ssh
for file in $KERNEL_HOME/plugins/org.eclipse.equinox.console.ssh_*.jar
do
CLASSPATH=$CLASSPATH:$KERNEL_HOME/plugins/${file##*/}
done

# make sure we have CLASSPATH set
if [ -z "$CLASSPATH" ]
then
echo No JAR files found in $KERNEL_HOME/lib
exit 1
fi
