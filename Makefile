.PHONY: run run-prod

run:
	set -a; \
	source .env; \
	set +a; \
	./gradlew bootRun

run-prod:
	set -a; \
	source .env.prod; \
	set +a; \
	./gradlew bootRun
