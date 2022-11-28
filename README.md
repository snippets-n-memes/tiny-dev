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

  ```sh
  kubectl run vscode --image=linuxserver/code-server
  kubectl expose pod vscode --port 8443 --target-port 8443
  ```
  - add entry to ingress
  ```yaml
    - backend:
            service:
              name: vscode
              port:
                number: 8443
          path: /
          pathType: Prefix
  ```
  - for nodeport ingress-controller deployment, get http port and node ip
  ```sh
  PORT=$(kubectl get svc -n ingress-nginx ingress-nginx-controller -o jsonpath='{.spec.ports[?(@.name=="http")].nodePort}')
  IP=$(kubectl get nodes --selector=node-role.kubernetes.io/master -o jsonpath="{.items[*].status.addresses[?(@.type=='InternalIP')].address}")
  ```
  - visit `http://$IP:$PORT` in your browser