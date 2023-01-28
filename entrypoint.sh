#!/bin/sh

crond -f &

nginx -g "daemon off;"
