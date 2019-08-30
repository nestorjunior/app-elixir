defmodule AppElixir.CLI.Menu.Items do
    alias AppElixir.CLI.Menu
    
    def all, do: [
        %Menu{ label: "Register a friend", id: :create },
        %Menu{ label: "List a friend", id: :read },
        %Menu{ label: "Update a friend", id: :update },
        %Menu{ label: "Delete a friend", id: :delete },
    ]

end