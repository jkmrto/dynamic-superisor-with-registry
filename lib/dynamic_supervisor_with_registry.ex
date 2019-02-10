#lib/dynamic_supervisor_example.ex
defmodule DynamicSupervisorWithRegistry do
  use Application

  @registry :workers_registry

  def start(_args, _opts) do
    children = [
      { DynamicSupervisorWithRegistry.WorkersSupervisor, [] },
      { Registry, [keys: :unique, name: @registry]}
    ]

    # It is important to comment the one_for_one strategy
    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end
