defmodule HelloWorld.HelloController do
  use HelloWorld.Web, :controller

  plug :welcome_message, "Welcome! " when action in [:index, :show]

  def index(conn, _params) do
    conn
    #|> assign(:message, "Welcome Back!")
    |> put_layout("admin.html")
    |> assign(:name, "Dweezil")
    |> render("index.html")
  end

  defp welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end

  def show(conn, %{"messenger" => messenger}) do
    conn
    |> assign(:message, "--overridden")
    |> render "show.html", messenger: messenger
  end

  def void(conn, _params) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")
  end
end
