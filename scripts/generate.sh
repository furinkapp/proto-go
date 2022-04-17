#!/usr/bin/env bash
set -euo pipefail
# get script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# run protoc
echo Generating Go gRPC code...
cd $SCRIPT_DIR/../
protoc --go_out=src --go_opt=paths=source_relative \
    --go-grpc_out=src --go-grpc_opt=paths=source_relative \
	--proto_path=proto \
    proto/*.proto
