FROM ubuntu:precise

MAINTAINER Doug Tangren <d.tangren@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade

RUN apt-get -y --force-yes \
            install supervisor \
                    curl git python --no-install-recommends

RUN mkdir -p /var/log/supervisor

COPY ./etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./bin/run /bin/run

RUN export NODE_VERSION=0.11.0 \
    && curl --progress-bar \
           "http://nodejs.org/dist/v0.11.0/node-v$NODE_VERSION-linux-x64.tar.gz" \
     | tar xz && mv "node-v$NODE_VERSION-linux-x64" /usr/local/node

RUN export STATSD_VERSION=0.7.2 \
   && git clone -b tags/v$STATSD_VERSION --depth 1 \
                 https://github.com/etsy/statsd.git statsd \
   && apt-get purge -y curl git python

EXPOSE 8125/udp 8126

CMD /bin/run

RUN apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*