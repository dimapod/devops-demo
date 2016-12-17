#!/usr/bin/env bash

TARGET=devops
LOGIN_CMD="fly -t ${TARGET} login --concourse-url http://ec2-35-156-176-228.eu-central-1.compute.amazonaws.com:8080 --username concourse --password xebia"

setVars() {
    PIPELINE_NAME=$1
    SET_PIPELINE_CMD="fly -t ${TARGET} set-pipeline -p ${PIPELINE_NAME} -c /home/pipeline.yml --load-vars-from /s3-credentials.yml -n"
    UNPAUSE_PIPELINE_CMD="fly -t ${TARGET} unpause-pipeline -p ${PIPELINE_NAME}"
    DESTROY_PIPELINE_CMD="fly -t ${TARGET} destroy-pipeline -p ${PIPELINE_NAME} -n"
}

# SET PIPELINE
doSetPipeline() {
    PIPELINE_NAME=$1
    PIPELINE_FILE=$2

    setVars ${PIPELINE_NAME}
    docker run --rm \
        -v ${PIPELINE_FILE}:/home/pipeline.yml \
        -v ~/s3-credentials.yml:/s3-credentials.yml fly \
        "${LOGIN_CMD}; ${SET_PIPELINE_CMD}; ${UNPAUSE_PIPELINE_CMD}"
}

# DESTROY PIPELINE
doDestroyPipeline() {
    setVars $1
    docker run --rm fly "${LOGIN_CMD}; ${DESTROY_PIPELINE_CMD}"
}

case "$1" in
    set-pipeline)
        doSetPipeline $2 $3
    ;;
    destroy-pipeline)
        doDestroyPipeline $2
    ;;
esac