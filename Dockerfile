FROM debian:latest
LABEL org.label-schema.name="ricariel/exim" \
      org.label-schema.vendor="fabrice.kirchner@casa-due-pur.de" \
      org.label-schema.url="https://github.com/ricariel/exim-docker" \
      org.label-schema.vcs-url="https://github.com/ricariel/exim-docker.git" \
      org.label-schema.schema-version="1.0" \
			org.opencontainers.image.authors="fabrice.kirchner@casa-due-pur.de" \
      org.label-schema.vcs-type=Git \
      org.label-schema.maintainer="fabrice.kirchner@casa-due-pur.de"

ARG DEBIAN_FRONTEND=noninteractive
ENV LC_ALL C

RUN set -uex; \
    apt-get update -y; \
		apt-get upgrade -y; \
    apt-get install -y \
			mariadb-client \
			exim4-daemon-heavy \
      libswitch-perl \
			openssl \
			curl \
			ca-certificates; \
    apt-get clean all; \
    rm -rf /var/lib/apt/lists/*;

EXPOSE 25
EXPOSE 465
EXPOSE 587

ENTRYPOINT ["/usr/sbin/exim"]
CMD ["-c","/etc/exim"]

