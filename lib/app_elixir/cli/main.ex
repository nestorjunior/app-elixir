defmodule AppElixir.CLI.Main do
    alias Mix.Shell.IO, as: Shell
    
    def start_app do
        Shell.cmd("clear")
        welcome_message()
        Shell.prompt("Enter to continue...")
    end

    defp welcome_message do
        Shell.info("---- App Elixir ---")
        Shell.info("App Elixir")
        Shell.info("-------------------")
    end
end