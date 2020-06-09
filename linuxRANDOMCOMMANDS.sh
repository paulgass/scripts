#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "THIS SCRIPT MUST BE RUN AS 'root' USER"
   exit 1
fi

NOWSECOND=$(date +"%Y%m%d%H%M%S")

ecscluster=gass${NOWSECOND}cluster

cat > createjsongateway.py << EOF909
import json

a = open('aws-ec2-gateways.json')
b = json.load(a)
lgrtids = {}
for x in b['LocalGatewayRouteTables']:
    lgrtids.append(x['LocalGatewayRouteTableId'])
a.close()
with open('local-gateway-route-table-ids1.json', 'w') as f:
	json.dump(lgrtids, f)
EOF909

aws ecs list-clusters > aws-ecs-clusters.json

ecsclusterarnWHITESPACEQUOTES=$(cat aws-ecs-clusters.json | grep $ecscluster)

ecsclusterarnQUOTES=$(echo $ecsclusterarnWHITESPACEQUOTES | tr -d ' ')

ecsclusterarn=$(echo $ecsclusterarnQUOTES | tr -d '"')

curl -sSL https://get.docker.com/ | sh
