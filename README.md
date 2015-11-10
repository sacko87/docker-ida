# docker-ida
A Docker project that provides the demo version of the binary analysis tool IDA.

*I'll explain all this later :)*

## Build

```bash
docker build -t sacko87/docker-ida git@github.com:sacko87/docker-ida.git
```

## Run
```bash
docker run --rm -it -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix sacko87/docker-ida 
```

### OSX
```bash
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
```

```
[sacko@odin:~]$ ifconfig vboxnet0
vboxnet0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
	ether 0a:00:27:00:00:00 
	inet 192.168.99.1 netmask 0xffffff00 broadcast 192.168.99.255
```

```bash
docker run --rm -it -e DISPLAY=192.168.99.1 sacko87/docker-ida 
```

### Windows
Your guess is as good as mine :). I don't have a windows machine to try it out.
