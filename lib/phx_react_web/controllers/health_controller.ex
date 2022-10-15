defmodule PhxReactWeb.HealthController do
  # pulls in plug macros
  use PhxReactWeb, :controller

  def index(conn, _params) do
    send_resp(conn, 204, "")
  end
end
