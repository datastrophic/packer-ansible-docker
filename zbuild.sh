#!/bin/bash
set -e

var_file=${1}
images=(
        base-image
        oracle-java
        spark-base
        spark-mesos
)

if [ -z "$var_file" ]
then
  echo "Packer variables files must be provided as a script argument, e.g.:"
  echo "zbuild.sh packer/vars/versions.json"
else
  for image in ${images[@]}; do
    echo "starting build for ${image}"
    packer build -var-file=${var_file} packer/${image}.json
    sleep 5
  done
fi
