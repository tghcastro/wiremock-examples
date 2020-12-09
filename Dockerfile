FROM openjdk:8-jre

LABEL maintainer="Thiago de Castro <tghcastro@gmail.com>"

ENV WIREMOCK_VERSION 2.27.2

RUN mkdir -p /var/wiremock/lib/ \
    && wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/$WIREMOCK_VERSION/wiremock-jre8-standalone-$WIREMOCK_VERSION.jar \
    -O /var/wiremock/lib/wiremock-jre8-standalone.jar

COPY entrypoint.sh /
RUN ["chmod", "+x", "entrypoint.sh"]

WORKDIR /home/wiremock

VOLUME /home/wiremock
EXPOSE 8080 8443

COPY ./mappings/*.json ./mappings/

ENTRYPOINT ["/entrypoint.sh"]
CMD java $JAVA_OPTS -cp /var/wiremock/lib/*:/var/wiremock/extensions/* com.github.tomakehurst.wiremock.standalone.WireMockServerRunner