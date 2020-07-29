# Minimal (1.5MB) TFTP Server in docker

Run `tftpd` (from busybox) as unprivileged user `nobody` serving files from the (empty) `/tftproot` directory in read-only mode:

```shell
docker run -p 69:8069/udp blenessy/tftpd
```

Initially the `/tftproot` VOLUME is empty so you need to copy some files to it.
Alternatively you can bind mount some files/dirs:

```shell
docker run tftpd -p 69:8069/udp -v "$(pwd)/tftproot:/tftproot" blenessy/tftpd
```

## Configuration

| Environment Variable | Default | Description |
| --- | --- | --- |
| `TFTPD_OPTS` | `-r` | Allows you to change `tftpd` CLI args. |
