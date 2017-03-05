iex:
	docker run -ti --rm -v $(PWD):/tmp elixir:latest
	
shell:
	docker run -ti --rm -v $(PWD):/tmp elixir:latest bash

