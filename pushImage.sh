#!/bin/bash
set -e

## Example
# ./pushImage.sh remoteImageName:tag localImageName:tag
# ./pushImage.sh nextcloud:20.0.4-apache nextcloud:20.0.4


REMOTEIMAGE=$1
LOCALNAME=$2
LOCALREG='localhost:30002'

echo "`r`n Pulling ${REMOTEIMAGE}"
docker pull ${REMOTEIMAGE}

echo "`r`n Tagging ${LOCALREG}/${LOCALNAME}"
docker tag ${REMOTEIMAGE} ${LOCALREG}/${LOCALNAME}

echo "`r`nPushing to ${LOCALREG}"
docker push ${LOCALREG}/${LOCALNAME}

echo "`r`n Removing tag ${LOCALREG}/${LOCALNAME}"
docker image remove ${LOCALREG}/${LOCALNAME}

echo "`r`n Removing remote image"
docker image remove ${REMOTEIMAGE}
