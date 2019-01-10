#!/bin/bash

#
# make adjustment when running under cygwin
#
if $cygwin; then
    CLASSPATH=$(cygpath -wp $CLASSPATH)
fi

if [ -z "$JAVA_HOME" ]
then
  	JAVA_EXECUTABLE=java
else
  	JAVA_EXECUTABLE=$JAVA_HOME/bin/java
fi

# Run java version check with the discovered java jvm.
$JAVA_EXECUTABLE \
	-classpath $CLASSPATH \
	org.eclipse.virgo.util.env.JavaVersionChecker

# If non-zero exit then either we cannot find the check or the java version is incorrect.
if [ $? != 0 ]
then
	exit 1
fi
