FORCE:

compile: FORCE
	touch .gitignore
	docker build -t jsonnet-releases .
	docker run --rm -d --name jsonnet-releases jsonnet-releases tail -f /dev/null
	docker cp -a jsonnet-releases:/jsonnet/jsonnet .
	docker stop -t 1 jsonnet-releases
	# sudo cp jsonnet /usr/local/bin/
