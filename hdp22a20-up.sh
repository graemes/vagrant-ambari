#!/bin/sh

export VAGRANT_ENV_NAME="hdp22a20"
export AMBARI_REPO="http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.1/ambari.repo"

vagrant up

curl --user admin:admin -H 'X-Requested-By:ambari' -X POST http://192.168.0.101:8080/api/v1/blueprints/multi-node-hdfs-yarn -d @blueprints/hdp22a20-multi-node-hdfs-yarn.json
curl --user admin:admin -H 'X-Requested-By:ambari' -X POST http://192.168.0.101:8080/api/v1/clusters/hdp22a20 -d @blueprints/basic-cluster.json

unset VAGRANT_ENV_NAME AMBARI_REPO
