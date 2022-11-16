# Edit `.config.sh`

Update following variables

```
STATE="US"
LOCATION="New York"
ORG="Personal"
OU="Server"
CN="rootcert"
```

# Create certificates

```bash
❯ mkdir -p certs

❯ ./generate.sh  
Root CA Key password:  5V8QWzMQE7mJudirojpmjg==
Creating root key...
Generating RSA private key, 4096 bit long modulus
................................++
.............................++
e is 65537 (0x10001)
Self signing root key...
Create server cert key...
Generating RSA private key, 4096 bit long modulus
.................................................................................................................................................................++
.................................................................................................................................++
e is 65537 (0x10001)
Create CSR for server cert...
Create server cert...
Signature ok
subject=/C=CA/ST=Ontario/L=Toronto/O=Personal/OU=Server/CN=servercert
Getting CA Private Key
Create client cert key...
Generating RSA private key, 4096 bit long modulus
...........................................................++
......++
e is 65537 (0x10001)
Create CSR for client cert...
Create client cert...
Signature ok
subject=/C=CA/ST=Ontario/L=Toronto/O=Personal/OU=Server/CN=clientcert
Getting CA Private Key
Convert client certificate to pkcs12 (Browser certificate)...
----------------------------------------------------------------
Validate server and client certificates...
certs/server.crt: OK
certs/client.crt: OK

❯ ./cleanup.sh         
Empty certs directory

❯
```

# References:
- http://datacenteroverlords.com/2012/03/01/creating-your-own-ssl-certificate-authority/
- http://support.nordicedge.com/nsd1309-creating-self-signed-certificates-using-openssl/

