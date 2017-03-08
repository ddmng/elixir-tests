defmodule HelloWorld.Api.V1.ImageController do
  use HelloWorld.Web, :controller

  def show(conn, _params) do
    page = %{title: "foo"}

    render conn, "show.json", page: page
  end

  def index(conn, _params) do
    pages = [%{title: "foo"}, %{title: "bar"}]

    render conn, "index.json", pages: pages
  end

end
