#!/bin/sh

BACKEND_STORE_URI="$KEY@$ENDPOINT:$PORT/$DB"

mlflow server \
  --host 0.0.0.0:5000 \
  --backend-store-uri "$BACKEND_STORE_URI" \
  --default-artifact-root "$ARTEFACT_ROOT"
