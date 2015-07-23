#!/bin/sh

export VAGRANT_ENV_NAME="hdp22a17"
export AMBARI_REPO="http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.1/ambari.repo"

vagrant destroy

unset VAGRANT_ENV_NAME AMBARI_REPO
