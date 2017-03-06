FROM elixir:latest

RUN apt-get update && apt-get install -y inotify-tools

RUN mix local.hex --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
