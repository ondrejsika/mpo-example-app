VERSION = 0.4.0

all:
	@make docker-build
	@make docker-push
	@make helm-push-to-oci

docker-build:
	docker build backend \
		--platform linux/amd64 \
		-t harbor.sl.zone/mpo-example-app/backend:$(VERSION)
	docker build frontend \
		--platform linux/amd64 \
		-t harbor.sl.zone/mpo-example-app/frontend:$(VERSION)

docker-push:
	docker push harbor.sl.zone/mpo-example-app/backend:$(VERSION)
	docker push harbor.sl.zone/mpo-example-app/frontend:$(VERSION)

copy-to-harbor:
	crane copy \
		ghcr.io/sikalabs/slu:v0.85.0 \
		harbor.sl.zone/mpo-example-app/slu:v0.85.0
	crane copy \
		redis \
		harbor.sl.zone/mpo-example-app/redis

helm-push-to-oci:
	helm package ./kubernetes/helm --version $(VERSION)
	helm push mpo-example-app-$(VERSION).tgz oci://harbor.sl.zone/mpo-example-app/helm
