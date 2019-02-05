#lib/dynamic_supervisor_example.ex
defmodule DynamicSupervisorExample do
  use Application

  def start(_args, _opts) do
    children = [
      { DynamicSupervisorExample.WorkersSupervisor, [] }
    ]

    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end
