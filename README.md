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

- ingress-nginx [expose tcp service](https://kubernetes.github.io/ingress-nginx/user-guide/exposing-tcp-udp-services/)

- ssh may be the wrong approach if [vscode server](https://code.visualstudio.com/docs/remote/vscode-server) can do it over http
