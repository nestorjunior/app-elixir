defmodule AppElixir.CLI.Main do
    alias Mix.Shell.IO, as: Shell
    
    def start_app do
        Shell.cmd("clear")
        welcome_message()
        Shell.prompt("Enter to continue...")
        starts_menu_choice()
    end

    defp welcome_message do
        Shell.info("--------------------")
        Shell.info("---- App Elixir ----")
        Shell.info("--------------------")
    end

    defp starts_menu_choice do
        AppElixir.CLI.Menu.Choice.start
    end
end