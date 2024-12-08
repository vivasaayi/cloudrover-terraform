COMMAND := docker run -it \
			-v ${PWD}:/app/cloudrover \
			-v ~/.aws:/root/.aws \
			--workdir /app/cloudrover \
			-e AWS_PROFILE=cloudrover \
		   	local_terraform

init:
	$(COMMAND) terraform init

initupgrade:
	$(COMMAND) terraform init --upgrade

plan:
	$(COMMAND) terraform plan

apply:
	$(COMMAND) terraform apply

destroy:
	$(COMMAND) terraform destroy

shell:
	$(COMMAND) /bin/sh

.PHONY:
buildcontainer:
	docker build -t local_terraform .

whoami:
	$(COMMAND) aws sts get-caller-identity