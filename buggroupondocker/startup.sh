#!/bin/bash
#Startup script used for boostrapping docker container
set -e
#startup application
if [ "$1" = 'node' ]; then

  #start application
  exec "$@"
fi
#exec other commands
exec "$@"