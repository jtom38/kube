#!/bin/bash

echo "APPNAME: "
read APPNAME


if [ ! -d "$APPNAME" ]
then
  mkdir "$APPNAME" 
fi

if [ ! -d "$APPNAME/deploymentss" ] 
then
  mkdir "$APPNAME/deployments"
fi

if [ ! -d "$APPNAME/services" ] 
then
  mkdir "$APPNAME/services"
fi

if [ ! -d "APPNAME/volumes" ] 
then
  mkdir "$APPNAME/volumes"
fi


