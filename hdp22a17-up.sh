#!/bin/sh

export VAGRANT_ENV_NAME="hdp22a17"
export AMBARI_REPO="http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo"

vagrant up
#sleep 60
#curl --user admin:admin -H 'X-Requested-By:ambari' -X PUT http://192.168.0.101:8080/api/v1/stacks/HDP/versions/2.2/operating_systems/redhat6/repositories/HDP-2.2 -d '{"Repositories": {"base_url": "http://mirrors.graemes.com/mirrors/hdp/centos6/HDP-2.2.0.0", "verify_base_url": false}}'
#curl --user admin:admin -H 'X-Requested-By:ambari' -X PUT http://192.168.0.101:8080/api/v1/stacks/HDP/versions/2.2/operating_systems/redhat6/repositories/HDP-UTILS-1.1.0.20/ -d '{"Repositories": {"base_url": "http://mirrors.graemes.com/mirrors/hdp/centos6/HDP-UTILS-1.1.0.20", "verify_base_url": false}}'
curl --user admin:admin -H 'X-Requested-By:ambari' -X POST http://192.168.0.101:8080/api/v1/blueprints/multi-node-hdfs-yarn -d @blueprints/hdp22a17-multi-node-hdfs-yarn.json
#curl --user admin:admin -H 'X-Requested-By:ambari' -X POST http://192.168.0.101:8080/api/v1/clusters/hdp22a17 -d @blueprints/basic-cluster.json

unset VAGRANT_ENV_NAME AMBARI_REPO
