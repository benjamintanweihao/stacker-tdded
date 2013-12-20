defmodule StackerServerTest do
  use ExUnit.Case

  setup do
    Stacker.Server.start([])
  end

  teardown do
    Stacker.Server.stop
  end

  test "item can be pushed into the stack" do
    Stacker.Server.push(:item)
    assert [:item] == Stacker.Server.items
  end

  test "item can be popped from the stack" do
    Stacker.Server.push(:item)
    assert :item == Stacker.Server.pop
  end

  test "items can be listed in the stack" do
    Stacker.Server.push(:red)
    Stacker.Server.push(:green)
    Stacker.Server.push(:blue)
    assert [:blue, :green, :red] == Stacker.Server.items
  end

end
