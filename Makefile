.PHONY: version

help:
	@echo 'Usage:'
	@echo '  make <target>'
	@echo 
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo

build:   ## Build latest CentOS
	@packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-7.4.1708.json vagrant-centos-atlas.json