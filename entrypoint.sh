#!/bin/bash

set -e

if [ "$1" = 'start' ]; then
    trap "echo TRAPed signal" HUP INT QUIT KILL TERM

    echo "Starting Atlassian Confluence"
    /opt/confluence/bin/start-confluence.sh

    echo "[hit enter key to exit] or run 'docker stop <container>'"
	read
	echo "Stopping Atlassian Confluence"
	/opt/confluence/bin/stop-confluence.sh
else
    exec "$@"
fi
