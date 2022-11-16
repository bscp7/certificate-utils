#!/usr/bin/env bash

root_password=$(openssl rand -base64 16)
server_password=""
client_password=""

COUNTRY="CA"
STATE="Ontario"
LOCATION="Toronto"
ORG="Personal"
OU="Server"
CN="rootcert"

# Whatever method you use to generate the certificate and key files, 
# the Common Name value used for the server and client 
# certificates/keys must each differ from the Common Name value used 
# for the CA certificate. Otherwise, the certificate and key files 
# do not work for servers compiled using OpenSSL.
# https://dev.mysql.com/doc/refman/5.7/en/creating-ssl-files-using-openssl.html

CN_CLIENT="clientcert"
CN_SERVER="servercert"
