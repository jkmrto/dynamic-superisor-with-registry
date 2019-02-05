defmodule DynamicSupervisorExampleTest do
  use ExUnit.Case
  doctest DynamicSupervisorExample

  test "greets the world" do
    assert DynamicSupervisorExample.hello() == :world
  end
end
