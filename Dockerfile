FROM busybox:1.32-musl

# run on a non-privileged port
EXPOSE 8069/udp

# create volume
RUN mkdir /tftproot && \
    chown nobody:nogroup /tftproot
VOLUME /tftproot
WORKDIR /tftproot

# read-only
ENV TFTPD_OPTS="-r"

# drop all privileges
USER nobody:nogroup

# default command
CMD echo "TFTPD_OPTS=$TFTPD_OPTS" && \
    exec /bin/udpsvd -vE 0.0.0.0 8069 tftpd $TFTPD_OPTS
