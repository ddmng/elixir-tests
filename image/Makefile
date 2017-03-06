build:
	docker build -t rdaneel/phoenix:0.1 .

pg:
	docker run -it -d --name postgres-local -p 5432:5432 postgres
	
shell: build
	docker run -p 4000:4000 --link postgres-local:postgres -ti --rm --name phoenix-shell -v ${PWD}/projects:/usr/phoenix/projects rdaneel/phoenix:0.1 bash

clean:
	docker kill postgres-local
	docker rm postgres-local
