#!/bin/sh

npm run build
cd dist
tar czf fe-auto1.tgz *
scp fe-auto1.tgz root@bb97.k.time4vps.cloud:/root/deploy/auto1

ssh root@bb97.k.time4vps.cloud /root/deploy/auto1/fe-deploy-auto1.sh
