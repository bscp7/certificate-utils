#!/usr/bin/env bash

echo "----------------------------------------------------------------"
echo "Validate server and client certificates..."
openssl verify -CAfile certs/rootCA.pem certs/server.crt
openssl verify -CAfile certs/rootCA.pem certs/client.crt 
