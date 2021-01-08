#
# sysbox-mgr Makefile
#
# Note: targets must execute from the $SYSMGR_DIR

.PHONY: clean sysbox-mgr-debug sysbox-mgr-static lint list-packages

GO := go

SYSMGR_DIR := $(CURDIR)
SYSMGR_SRC := $(shell find . 2>&1 | grep -E '.*\.(c|h|go)$$')

SYSMGR_GRPC_DIR := ../sysbox-ipc/sysboxMgrGrpc
SYSMGR_GRPC_SRC := $(shell find $(SYSMGR_GRPC_DIR) 2>&1 | grep -E '.*\.(c|h|go|proto)$$')

LIBDOCKER_DIR := ../sysbox-libs/dockerUtils
LIBDOCKER_SRC := $(shell find $(LIBDOCKER_DIR) 2>&1 | grep -E '.*\.(go)')

LDFLAGS := '-X main.version=${VERSION} -X main.commitId=${COMMIT_ID} \
			-X "main.builtAt=${BUILT_AT}" -X main.builtBy=${BUILT_BY}'

sysbox-mgr: $(SYSMGR_SRC) $(SYSMGR_GRPC_SRC) $(LIBDOCKER_SRC)
	$(GO) build -ldflags ${LDFLAGS} -o sysbox-mgr

sysbox-mgr-debug: $(SYSMGR_SRC) $(SYSMGR_GRPC_SRC) $(LIBDOCKER_SRC)
	$(GO) build -gcflags="all=-N -l" -o sysbox-mgr

sysbox-mgr-static: $(SYSMGR_SRC) $(SYSMGR_GRPC_SRC) $(LIBDOCKER_SRC)
	CGO_ENABLED=1 $(GO) build -tags "netgo osusergo static_build" \
		-installsuffix netgo -ldflags "-w -extldflags -static" \
		-o sysbox-mgr

lint:
	$(GO) vet $(allpackages)
	$(GO) fmt $(allpackages)

listpackages:
	@echo $(allpackages)

clean:
	rm -f sysbox-mgr

# memoize allpackages, so that it's executed only once and only if used
_allpackages = $(shell $(GO) list ./... | grep -v vendor)
allpackages = $(if $(__allpackages),,$(eval __allpackages := $$(_allpackages)))$(__allpackages)
