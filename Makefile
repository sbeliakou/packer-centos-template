.PHONY: version

help:
	@echo 'Usage:'
	@echo '  make <target>'
	@echo 
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_0-9.-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo

last:    ## Build Latest CentOS (7.6)
	@packer build -var-file vars/centos-7.6.1810.json vagrant-centos-local.json

7.6:     ## Build CentOS 7.6
	@packer build -var-file vars/centos-7.6.1810.json vagrant-centos-local.json

7.5:     ## Build CentOS 7.5
	@packer build -var-file vars/centos-7.5.1804.json vagrant-centos-local.json

7.4:     ## Build CentOS 7.4
	@packer build -var-file vars/centos-7.4.1708.json vagrant-centos-local.json

7.3:     ## Build CentOS 7.3
	@packer build -var-file vars/centos-7.3.1611.json vagrant-centos-local.json

7.2:     ## Build CentOS 7.2
	@packer build -var-file vars/centos-7.2.1511.json vagrant-centos-local.json

6.9:     ## Build CentOS 6.9
	@packer build -var-file vars/centos-6.9.json vagrant-centos-local.json

6.8:     ## Build CentOS 6.8
	@packer build -var-file vars/centos-6.8.json vagrant-centos-local.json





