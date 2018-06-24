#!/bin/sh

npm run build
cd dist
tar czf fe-auto1.tgz *
scp fe-auto1.tgz root@10f20.k.time4vps.cloud:/root/deploy/auto1

ssh root@10f20.k.time4vps.cloud /root/deploy/auto1/fe-deploy-auto1.sh
