#!/usr/bin/env bash

source .config.sh

echo "Create server cert key..."
openssl genrsa \
    -out certs/server.key \
    -passout pass:$server_password 4096

echo "Create CSR for server cert..."
openssl req \
    -new \
    -key certs/server.key \
    -out certs/server.csr \
    -passin pass:$server_password \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCATION}/O=${ORG}/OU=${OU}/CN=${CN_SERVER}"

echo "Create server cert..."
openssl x509 \
    -req \
    -in certs/server.csr \
    -CA certs/rootCA.pem \
    -CAkey certs/rootCA.key \
    -CAcreateserial \
    -out certs/server.crt \
    -sha256 \
    -passin pass:$root_password \
    -days 365
