#!/bin/sh
set -e

./run_uwsgi.sh >/dev/null 2>/dev/null & uwsgi_pid=$!
./run_workaround.sh >/dev/null 2>/dev/null & workaround_pid=$!

# Wait for uWSGIs to start
sleep 1

set -x
# Normal request against uWSGI
curl -s --path-as-is http://localhost:8123/get/../admin

# Request with workaround
curl -s --path-as-is http://localhost:8124/get/../admin

set +x
kill ${uwsgi_pid} ${workaround_pid}
wait