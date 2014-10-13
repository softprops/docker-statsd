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
---------|---------
8125/udp | udp line interface
8126     | admin interface

```bash
$ docker run --rm -ti `whoami`/statsd
```

Doug Tangren (softprops) 2014
