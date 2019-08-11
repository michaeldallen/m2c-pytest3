include makelib/makelib.make

LOG   = 2>&1 | tee -a log.$(shell date +%Y.%m.%d_%H.%M.%S).$@
DATE  = date | sed -n '/\(.*\)/ { h ; 's/./-/g' p ; x ; p ; x ; p }'

SHELL := /bin/bash


IAM := m2c-pytest3

docker.build :
	docker build --tag ${IAM} pytest3


docker.run.bash : docker.socket.usable
	docker \
		run \
		-it \
		--rm \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		${IAM} \
		/bin/bash

docker.socket.usable :
	@echo checking docker socket usability
	@[ `awk -F: '$$1 == "docker" {print $$3}' /etc/group` -eq 999 ] && echo "docker GID is 999" || \
	 [ `stat --print=%a /var/run/docker.sock | cut -c3` -ge 6 ] && echo "docker socket is world read/writeable" || \
	 { echo "docker socket unusable" ; /bin/false ; }



pytest3.run.local : docker.socket.usable
	docker \
		run \
		--rm \
		--volume `pwd`:/workdir \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--name ${IAM} \
		${IAM} \
		 #

pytest3.run.dockerhub : docker.socket.usable
	docker \
		run \
		--rm \
		--volume `pwd`:/workdir \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--name ${IAM} \
		michaeldallen/${IAM} \
		 #


#EOF
