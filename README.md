# tiny-dev
PoC of locally hosted and self managed dev containers on kubernetes

```sh
# run with desired username & password as env vars
docker run \
  --env DEV_USER=fishbot \
  --env DEV_PASSWD=glub \
  -p 2222:22 \
  ssh
```