#!/bin/bash
./fixTermination.sh cephcluster.ceph.rook.io rook-ceph
./fixTermination.sh customresourcedefinition.apiextensions.k8s.io cephclusters.ceph.rook.io
