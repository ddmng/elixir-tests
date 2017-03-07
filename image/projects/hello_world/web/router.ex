defmodule HelloWorld.Router do
  use HelloWorld.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "text", "xml"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWorld do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/void", HelloController, :void
    get "/hello/:messenger", HelloController, :show
    resources "/users", UserController do
      resources "/posts", PostController
    end
    resources "/comments", CommentController
    resources "/reviews", ReviewController
  end
  # New route for redirects
  scope "/", HelloWorld do
    get "/redirect_test", PageController, :redirect_test, as: :redirect_test
  end

  scope "/admin", HelloWorld.Admin, as: :admin do
    pipe_through :browser

    resources "/reviews", ReviewController
    resources "/images",  ImageController
    resources "/users",   UserController
  end

  scope "/api", HelloWorld.Api, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/images",  ImageController
      resources "/reviews", ReviewController
      resources "/users",   UserController
    end
  end

end
