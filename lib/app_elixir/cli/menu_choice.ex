defmodule AppElixir.CLI.MenuChoice do
    alias Mix.Shell.IO, as: Shell
    alias AppElixir.CLI.MenuItems

    def start do
        Shell.cmd("clear")
        Shell.info("Choose an option: ")
        
        menu_items = MenuItems.all()
        find_menu_item_by_index = &Enum.at(menu_items, &1, :error)

        menu_items
        |> Enum.map(&(&1.label))
        |> display_options()
        |> generate_question()
        |> Shell.prompt
        |> parse_answer()
        |> find_menu_item_by_index.()
        |> confirm_menu_item()
    end

    defp display_options(n) do
        n
        |> Enum.with_index(1)
        |> Enum.each(fn {option, index} -> Shell.info("#{index} - #{option}") end)
        n
    end

    defp generate_question(n) do
        n = Enum.join(1..Enum.count(n),",")
        "What is your option? [#{n}]\n"
    end 

    defp parse_answer(answer) do
        case Integer.parse(answer) do
            :error -> invalid_option()
            {n, _} -> n - 1
        end
    end

    defp invalid_option() do
        Shell.cmd("clear")
        Shell.error("Sorry: Invalid option")
        Shell.prompt("Press enter to return!")
        start()
    end

    defp confirm_menu_item(chosen_menu_item) do
        Shell.cmd("clear")
        Shell.info("Your choice:  [#{chosen_menu_item.label}]")

        if Shell.yes?("Ok?") do
            Shell.info("... #{chosen_menu_item.label} ...")
        else 
            start()
        end
    end
end