FROM scratch
ADD alpine-minirootfs-3.10.1-x86_64.tar.gz /
CMD ["/bin/sh"]
