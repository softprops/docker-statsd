# docker statsd

A [statsd](https://github.com/etsy/statsd/) installation in a [Docker](https://www.docker.com/) container.

## usage

### build

```bash
$ docker build -t `whoami`/statsd .
```

### run

ports

port     | use
---------|-------------------
8125/udp | udp line interface
8126     | admin interface

env

var           | default value | use
--------------|---------------|----------------------------------
GRAPHITE_HOST | localhost     | hostname or IP of Graphite server
GRAPHITE_PORT | 2003          | port of Graphite server
STATSD_PORT   | 8125          | port to listen on

```bash
$ docker run --rm -ti `whoami`/statsd
```

Doug Tangren (softprops) 2014
