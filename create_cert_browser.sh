#!/usr/bin/env bash

echo "Convert client certificate to pkcs12 (Browser certificate)..."
openssl pkcs12 \
    -export \
    -in certs/client.crt \
    -inkey certs/client.key \
    -out certs/browser.p12 \
    -passin pass:$client_password \
    -passout pass:browser-password \
    -name "Browser Cert"
