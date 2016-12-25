#!/usr/bin/env bash

TARGET=devops
SCRIPT_PATH="`dirname \"$0\"`"
CONCOURSE_URL=$(${SCRIPT_PATH}/concourse-url.sh)

LOGIN_CMD="fly -t ${TARGET} login --concourse-url ${CONCOURSE_URL} --username concourse --password xebia"

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

    echo "\$docker> ${LOGIN_CMD}"
    echo "\$docker> ${SET_PIPELINE_CMD}"
    echo "\$docker> ${UNPAUSE_PIPELINE_CMD}"

    docker run --rm \
        -v ${PIPELINE_FILE}:/home/pipeline.yml \
        -v $(pwd)/s3-credentials.yml:/s3-credentials.yml \
        xebiafrance/fly \
        "${LOGIN_CMD}; ${SET_PIPELINE_CMD}; ${UNPAUSE_PIPELINE_CMD}"
}

# DESTROY PIPELINE
doDestroyPipeline() {
    setVars $1

    echo "\$docker> ${LOGIN_CMD}"
    echo "\$docker> ${DESTROY_PIPELINE_CMD}"

    docker run --rm xebiafrance/fly "${LOGIN_CMD}; ${DESTROY_PIPELINE_CMD}"
}

case "$1" in
    set-pipeline)
        doSetPipeline $2 $3
    ;;
    destroy-pipeline)
        doDestroyPipeline $2
    ;;
esac