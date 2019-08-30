defmodule Mix.Tasks.Start do
  use Mix.Task

  @shortdoc "Start [App]"
  def run(_) do
    AppElixir.CLI.Main.start_app()
  end
end
