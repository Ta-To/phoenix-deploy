#!/bin/sh

echo take2
release_ctl eval --mfa "MyApp.ReleaseTasks.migrate/1" --argv -- "$@"

# release_ctl eval "PhoenixDeploy.ReleaseTasks.migrate/0"
