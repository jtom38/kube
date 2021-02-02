#!/bin/bash
# About: This is a helper script to quickly resolve k8s
# services not terminting correctly
# Example:
# fixTermination.sh pv nextcloud-data
# fixTermination.sh pvc nextcloud-data-pvc


kubectl patch ${1} ${2} -p '{"metadata":{"finalizers":null}}'

