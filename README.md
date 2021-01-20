# njs
njs for use with nginx+

https://nginx.org/en/docs/njs/reference.html

## setup

copy your nginx-repo.crt and nginx-repo.key to nginx-plus/licenses/


### create a default server cert

```bash
echo "====self signed cert===="
cd nginx-plus/nginx/conf.d/certs
openssl genrsa -des3 -passout pass:1234 -out server.pass.key 2048
openssl rsa -passin pass:1234 -in server.pass.key -out server.key
rm server.pass.key
openssl req -new -key server.key -out server.csr -subj "/C=US/ST=testville/L=testerton/O=Test testing/OU=Test Department/CN=test.example.com"
openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt
```

### set function name in docker-compose.yml

  NJS = the name of your function in main.js

  ```yaml
  environment:
    - NJS=njsTest
  ```
## running

```bash
docker-compose up
```

## test

```bash
curl http://localhost/njs
```

## dev
```bash
#manual test pre-commit
pre-commit run -a -v
```
