# lib/dynamic_supervisor_example/worker.ex
defmodule DynamicSupervisorWithRegistry.Worker do
  use GenServer
  require Logger

  @registry :workers_registry

  ## API
  def start_link(name),
    do: GenServer.start_link(__MODULE__, name, name: via_tuple(name))

  def stop(name), do: GenServer.stop(via_tuple(name))

  def crash(name), do: GenServer.cast(via_tuple(name), :raise)

  ## Callbacks
  def init(name) do
    Logger.info("Starting #{inspect(name)}")
    {:ok, name}
  end

  def handle_cast(:work, name) do
    Logger.info("hola")
    {:noreply, name}
  end

  def handle_cast(:raise, name),
    do: raise RuntimeError, message: "Error, Server #{name} has crashed"

  def terminate(reason, name) do
    Logger.info("Exiting worker: #{name} with reason: #{inspect reason}")
  end

  ## Private
  defp via_tuple(name) ,
    do: {:via, Registry, {@registry, name} }

end
