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
  http://nginx.org/en/docs/http/ngx_http_js_module.html#js_include

  NJS = the name of your function in main.js

  the names by default are derived from the filename of your .js included and the name of your exported function.

  test.js
  ```js
  export default { njs }
  function njs(r) {
    r.return(200, "The njs module was loaded\n");
  }
  ```
  test.njs

  ```yaml
  environment:
    - NJS=test.njs
  ```
## running

```bash
docker-compose up
```

## re-running
```bash
# rerun the templates with envsubstr
docker-compose build
# start again
docker-compose up
```

## test

```bash
# test module loaded
curl http://localhost/test
# test your function
curl -v https://localhost/njs

```

## dev
```bash
#manual test pre-commit
pre-commit run -a -v
```
