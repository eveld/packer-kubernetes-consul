ts := $(shell /bin/date "+%s")

check-variables:
ifndef PROJECT
  $(error PROJECT is undefined)
endif
ifndef K8S_VERSION
  $(error K8S_VERSION is undefined)
endif
ifndef CONSUL_VERSION
  $(error CONSUL_VERSION is undefined)
endif

build: check-variables
	packer build -var 'project_id=${PROJECT}' -var 'k8s_version=${K8S_VERSION}' -var 'consul_version=${CONSUL_VERSION}' packer.json

force-build: check-variables
	packer build -force -var 'project_id=${PROJECT}' -var 'k8s_version=${K8S_VERSION}' -var 'consul_version=${CONSUL_VERSION}' packer.json
