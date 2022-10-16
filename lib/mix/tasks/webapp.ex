defmodule Mix.Tasks.Webapp do
  @moduledoc """
    React frontend compilation and bundling for production.
  """
  use Mix.Task
  require Logger
  # Path for the frontend static assets that are being served
  # from our Phoenix router when accessing /app/* for the first time
  @public_path "./priv/static/webapp"

  @shortdoc "Compile and bundle React frontend for production"
  def run(_) do
    Logger.info("📦 - Installing NPM packages")
    System.cmd("npm", ["install", "--quiet"], cd: "./frontend")

    Logger.info("⚙️  - Compiling React frontend")
    System.cmd("npm", ["run", "build"], cd: "./frontend")

    Logger.info("🚛 - Moving dist folder to Phoenix at #{@public_path}")

    with {_, 0} <- System.shell("build-frontend.sh") do
      Logger.info("⚛️  - React frontend ready.")
    else
      {_, exit_status} ->
        Logger.error("Error #{exit_status}")
    end

    # First clean up any stale files from previous builds if any
    # System.cmd("rm", ["-rfv", @public_path <> "/dist"])

    # System.cmd("cp", ["-r", "./frontend/dist", @public_path]) do
    # Logger.info("⚛️  - React frontend ready.")
  end
end
