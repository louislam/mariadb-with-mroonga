# Refernece: https://hub.docker.com/r/kazaoki/mariadb-mroonga/dockerfile

FROM mariadb:10.5

RUN apt update \
    && apt install -y mariadb-plugin-mroonga \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/share/mysql/mroonga/install.sql /docker-entrypoint-initdb.d
