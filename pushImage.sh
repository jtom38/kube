#!/bin/bash
set -e

REMOTEIMAGE=$1
LOCALNAME=$2
LOCALREG='localhost:30002'

echo "Pulling ${REMOTEIMAGE}"
docker pull ${REMOTEIMAGE}

echo "Tagging ${LOCALREG}/${LOCALNAME}"
docker tag ${REMOTEIMAGE} ${LOCALREG}/${LOCALNAME}

echo "Pushing to ${LOCALREG}"
docker push ${LOCALREG}/${LOCALNAME}

echo "Removing tag ${LOCALREG}/${LOCALNAME}"
docker image remove ${LOCALREG}/${LOCALNAME}
#docker image remove ${REMOTEIMAGE}
