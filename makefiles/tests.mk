.PHONY: test
test: ##@test Run unit, integration tests and combine coverage.
test: unit-test integration-test coverage-combine

.PHONY: unit-test
unit-test: ##@test Run unit tests for test_args=<file> provided.
unit-test:
	${DC} run --rm unit_test ${test_args} --junitxml=reports/unit-tests.xml --cov-report html:reports/coverage/unit-test -m unit

.PHONY: integration-test
integration-test: ##@test Run integration tests for test_args=<file> provided.
integration-test:
	${DC} run --rm integration_test ${test_args} --junitxml=reports/integration-tests.xml --cov-report html:reports/coverage/integration-test -m integration

.PHONY: unit-test-shell
unit-test-shell: ##@test Run unit tests shell.
unit-test-shell:
	${DC} run --rm --entrypoint=/bin/bash unit_test

.PHONY: integration-test-shell
integration-test-shell: ##@test Run integration tests shell.
integration-test-shell:
	${DC} run --rm --entrypoint=/bin/bash integration_test

.PHONY: coverage-combine
coverage-combine: ##@test Combine the integration and unit coverage reports.
	${DC} run --rm --entrypoint="coverage combine reports/coverage/coverage.unit reports/coverage/coverage.integration" base
	${DC} run --rm --entrypoint="coverage html --fail-under=100" base
	${DC} run --rm --entrypoint="coverage xml --fail-under=100" base

.PHONY: isort
isort: ##@test Run isort verification.
isort: args?= --diff --check-only --quiet -rc src/
isort:
	${DC} run --rm --no-deps isort ${args}


.PHONY: pylint
pylint: ##@test Run pylint verification.
pylint: args ?= --rcfile=/srv/.pylintrc /srv/src
pylint: isort
	${DC} run --rm --no-deps pylint ${args}
