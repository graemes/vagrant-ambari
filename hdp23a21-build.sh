#!/bin/sh

export VAGRANT_ENV_NAME="hdp23a21"
export AMBARI_REPO="http://mirrors.graemes.com/mirrors/local/ambari-2.1.0.repo"
export CENTOS_REPO="http://mirrors.graemes.com/mirrors/local/Centos-Base-6.repo"

vagrant up 
sleep 30

curl -H "X-Requested-By: ambari" -X PUT -u admin:admin http://192.168.0.101:8080/api/v1/stacks/HDP/versions/2.3/operating_systems/redhat6/repositories/HDP-2.3 -d '{"Repositories": {"base_url": "http://mirrors.graemes.com/mirrors/hdp/centos6/HDP-2.3.0.0/", "verify_base_url": false}}'
curl -H "X-Requested-By: ambari" -X GET -u admin:admin http://192.168.0.101:8080/api/v1/stacks/HDP/versions/2.3/operating_systems/redhat6/repositories/HDP-2.3

curl -H "X-Requested-By: ambari" -X PUT -u admin:admin http://192.168.0.101:8080/api/v1/stacks/HDP/versions/2.3/operating_systems/redhat6/repositories/HDP-UTILS-1.1.0.20 -d '{"Repositories": {"base_url": "http://mirrors.graemes.com/mirrors/hdp/centos6/HDP-UTILS-1.1.0.20/", "verify_base_url": false}}'
curl -H "X-Requested-By: ambari" -X GET -u admin:admin http://192.168.0.101:8080/api/v1/stacks/HDP/versions/2.3/operating_systems/redhat6/repositories/HDP-UTILS-1.1.0.20

curl --user admin:admin -H 'X-Requested-By:ambari' -X POST http://192.168.0.101:8080/api/v1/blueprints/multi-node-hdfs-yarn -d @blueprints/hdp23a21-multi-node-hdfs-yarn.json
curl --user admin:admin -H 'X-Requested-By:ambari' -X POST http://192.168.0.101:8080/api/v1/clusters/hdp23a21 -d @blueprints/basic-cluster.json

unset AMBARI_REPO
