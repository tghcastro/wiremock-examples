#!/bin/bash

set -e

# Add `java -jar /wiremock-standalone.jar` as command if needed
if [ "${1:0:1}" = "-" ]; then
	set -- java $JAVA_OPTS -cp /var/wiremock/lib/*:/var/wiremock/extensions/* com.github.tomakehurst.wiremock.standalone.WireMockServerRunner "$@"
fi

exec "$@"