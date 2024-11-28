COMMAND := docker run -it \
			-v ${PWD}:/app/cloudrover \
			-v ~/.aws:/root/.aws \
			--workdir /app/cloudrover \
			-e AWS_PROFILE=cloudrover \
		   	local_terraform

init:
	$(COMMAND) terraform init

plan:
	$(COMMAND) terraform plan

apply:
	$(COMMAND) terraform apply

shell:
	$(COMMAND) /bin/sh

.PHONY:
buildcontainer:
	docker build -t local_terraform .

whoami:
	$(COMMAND) aws sts get-caller-identity