.PHONY: run-prod

run-prod:
	set -a; \
	source .env.prod; \
	set +a; \
	./gradlew bootRun
