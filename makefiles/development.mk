.PHONY: build
build: ##@development Build containers. Needed only after changes in requirements.
build: args?= -f ${DOCKERFILE}
build:
	DOCKER_BUILDKIT=1 docker build -t "${PROJECT}:${PROJECT_VERSION}" \
		--build-arg GID=${GID} \
		--build-arg UID=${UID} \
		--progress plain \
		${args} .

.PHONY: clean
clean: ##@development  Stop and remove containers created by up command
	${DC} down --remove-orphans

.PHONY: logs
logs: ##@development Show logs for the current project
	${DC} logs -f

.PHONY: server
server: ##@development Start a API instance
server:
	${DC} up -d server

.PHONY: djshell
djshell:  ##@development Starts a django shell
	${DC} run --rm manage shell_plus

.PHONY: shell
shell: ##@development Starts a bash shell
	${DC} run --rm --entrypoint="/bin/bash" server

.PHONY: status
status: ##@development List images used by the created container, list containers and display the running processes.
	@echo
	${DC} images
	@echo
	${DC} ps
	@echo
	${DC} top
