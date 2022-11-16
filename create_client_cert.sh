#!/usr/bin/env bash

source .config.sh

echo "Create client cert key..."
openssl genrsa \
    -out certs/client.key \
    -passout pass:$client_password 4096

echo "Create CSR for client cert..."
openssl req \
    -new \
    -key certs/client.key \
    -out certs/client.csr \
    -passin pass:$client_password \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCATION}/O=${ORG}/OU=${OU}/CN=${CN_CLIENT}"

echo "Create client cert..."
openssl x509 \
    -req \
    -in certs/client.csr \
    -CA certs/rootCA.pem \
    -CAkey certs/rootCA.key \
    -CAcreateserial \
    -out certs/client.crt \
    -sha256 \
    -passin pass:$root_password \
    -days 365
