defmodule PhxReactWeb.WebappController do
  use PhxReactWeb, :controller

  def index(conn, _params) do
    conn
    |> send_resp(200, render_vue_app())
  end

  # Serve the index.html file as-is and let React
  # take care of the rendering and client-side rounting.
  #
  # Potential improvement: Cache the file contents here
  # in an ETS table so we don't read from the disk for every request.
  defp render_vue_app() do
    Application.app_dir(:phx_react, "/priv/static/webapp/dist/index.html")
    |> File.read!()
  end
end
