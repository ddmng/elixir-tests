defmodule HelloWorld.PageController do
  use HelloWorld.Web, :controller

  def index(conn, %{"name" => name} = params) do
    conn
    |> assign(:name, name)
    |> render :index, content: "<ciao></ciao>"
  end

  def index(conn, %{"redirect" => redirect}) do
    redirect conn, external: redirect_test_url(conn, :redirect_test)
  end

  def redirect_test(conn, _params) do
    redirect conn, external: "http://elixir-lang.org/"
  end

  def index(conn, _params) do
    conn
    |> render :index
  end

end
