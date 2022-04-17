PROTOC=$(shell which protoc)
PROTOC_INCLUDES=-I ./proto
PROTOC_OUT=./src
PROTOC_PATHS_OPTS=paths=source_relative
PROTOC_BASE_PROTO=proto/*.proto

.PHONY: grpc

grpc:
	@echo "Generating go protobuf code..."
	@mkdir -p $(PROTOC_OUT)
	rm -rf $(PROTOC_OUT)/*
	$(PROTOC) $(PROTOC_INCLUDES) --go_out=$(PROTOC_OUT) --go_opt=$(PROTOC_PATHS_OPTS) \
		--go-grpc_out=$(PROTOC_OUT) --go-grpc_opt=$(PROTOC_PATHS_OPTS) $(PROTOC_BASE_PROTO)
