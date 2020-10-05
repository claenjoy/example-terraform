#!/bin/bash

set -e
export AZURE_SUBSCRITION_ID="b63582fe-6299-4942-959a-2b8a03b8b420"
export AZURE_TENANT_ID="018567ba-0458-4e88-95c0-05dc36aed410"



terraform init \
-input=false \
-backend=true \
-backend-config="subscription_id=${AZURE_SUBSCRITION_ID}" \
-backend-config="tenant_id=${AZURE_TENANT_ID}"