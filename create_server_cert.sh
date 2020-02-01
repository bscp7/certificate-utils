#!/usr/bin/env bash

source .config.sh

echo "Create server cert key..."
openssl genrsa -out certs/server.key -passout pass:$server_password 4096

echo "Create CSR for server cert..."
openssl req -new -key certs/server.key -out certs/server.csr -passin pass:$server_password -subj "/C=CA/ST=British Colombia/L=Vancouver/O=Business/OU=Root/CN=localhost"

echo "Create server cert..."
openssl x509 -req -in certs/server.csr -CA certs/rootCA.pem -CAkey certs/rootCA.key -CAcreateserial -out certs/server.crt -days 365 -sha256 -passin pass:$root_password
