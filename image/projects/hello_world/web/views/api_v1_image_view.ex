defmodule HelloWorld.Api.V1.ImageView do
  use HelloWorld.Web, :view

  def render("index.json", %{pages: pages}) do
    %{data: render_many(pages, HelloWorld.Api.V1.ImageView, "page.json")}
  end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, HelloWorld.Api.V1.ImageView, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end

end
