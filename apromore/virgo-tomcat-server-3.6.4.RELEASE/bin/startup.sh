#!/bin/bash

SCRIPT="$0"

# SCRIPT may be an arbitrarily deep series of symlinks. Loop until we have the concrete path.
while [ -h "$SCRIPT" ] ; do
  ls=`ls -ld "$SCRIPT"`
  # Drop everything prior to ->
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    SCRIPT="$link"
  else
    SCRIPT=`dirname "$SCRIPT"`/"$link"
  fi
done

SCRIPT_DIR=`dirname $SCRIPT`
EXECUTABLE="dmk.sh"

#
# identify yourself when running under cygwin
#
cygwin=false
case "$(uname)" in
    CYGWIN*) cygwin=true ;;
esac
export cygwin

# Start the X virtual frame buffer (Xvfb)
# if [ -f /usr/X11R6/bin/Xvfb ]; then
# /usr/X11R6/bin/Xvfb :1 -screen 0 1024x768x16 &
# fi
# echo "Starting X virtual framebuffer (Xvfb) in background..."
# Xvfb :1 -screen 0 1024x768x16 &
# Set the DISPLAY variable for the X virtual frame buffer (Xvfb)
# export DISPLAY=localhost:1.0

exec "$SCRIPT_DIR"/"$EXECUTABLE" start "$@"
