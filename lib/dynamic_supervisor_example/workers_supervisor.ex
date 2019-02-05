# lib/dynamic_supervisor_example/workers_supervisor.ex
defmodule DynamicSupervisorExample.WorkersSupervisor do
  use DynamicSupervisor

  def start_link(_arg),
    do: DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)

  def init(_arg),
    do: DynamicSupervisor.init(strategy: :one_for_one)

end
