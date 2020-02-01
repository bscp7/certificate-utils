#!/usr/bin/env bash

source .config.sh

echo "Root CA Key password: " $root_password

echo "Creating root key..."
openssl genrsa -out certs/rootCA.key -passout pass:$root_password 4096

echo "Self signing root key..."
openssl req -x509 -new -nodes -key certs/rootCA.key -days 1024 -out certs/rootCA.pem -passin pass:$root_password -subj "/C=CA/ST=British Colombia/L=Vancouver/O=Business/OU=Root/CN=Root Cert"
