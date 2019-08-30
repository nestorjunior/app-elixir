defmodule AppElixir.CLI.MenuChoice do
    alias Mix.Shell.IO, as: Shell

    def start do
        Shell.cmd("clear")
        Shell.info("Choose an option")
        
        menu_items = AppElixir.CLI.MenuItems.all()

        menu_items
        |> Enum.map(&(&1.label))
        |> display_options
    end

    defp display_options(n) do
        n
        |> Enum.with_index(1)
        |> Enum.each(fn {option, index} -> Shell.info("#{index} - #{option}") end)
    end
end