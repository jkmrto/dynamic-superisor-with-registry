defmodule DynamicSupervisorWithRegistryTest do
  use ExUnit.Case
  doctest DynamicSupervisorWithRegistry

  test "greets the world" do
    assert DynamicSupervisorWithRegistry.hello() == :world
  end
end
