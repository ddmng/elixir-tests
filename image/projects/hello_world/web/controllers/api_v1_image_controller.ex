defmodule HelloWorld.Api.V1.ImageController do
  use HelloWorld.Web, :controller

  def show(conn, %{"id" => id }) do
    json conn, %{id: id}
  end
end
