FROM alpine:3.16

RUN apk update
RUN apk install -y mariadb-server

# porta solita per MariaDB, non obbligatoria
EXPOSE 3306 

# LABEL crea variabili descrittive utilizzabili eventualmente in alcuni contesti. Non necessarie
LABEL version="1.0"
LABEL description="MariaDB Server"

COPY tools/configure.sh /tmp

RUN sh /tmp/configure.sh

# HEALTHCHECK controlla la validità del db ogni 5 minuti. Si fa perché il db potrebbe essere compromesso
# o semplicemente non disponibile per altre chiamate. In caso di successo torna 0, altrimenti 1.
HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mysqld"]

