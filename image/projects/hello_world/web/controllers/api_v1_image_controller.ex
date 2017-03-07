defmodule HelloWorld.Api.V1.ImageController do
  use HelloWorld.Web, :controller

  def show(conn, %{"id" => id }) do
    json conn, %{id: id}
  end

  def edit(conn, %{"id" => id}) do
    html conn, """
    <html>
      <head>Test</head>
      <body>Test #{id}</body>
    </html>
    """
  end
end
