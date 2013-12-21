defmodule Stacker.Server do
  use GenServer.Behaviour

  def start_link(stack) do
    :gen_server.start_link({:local, :stacker}, __MODULE__, stack, [])
  end

  # Public API
  def push(item) do
    :gen_server.cast(:stacker, { :push, item })
  end

  def pop do
    :gen_server.call(:stacker, :pop) 
  end

  def items do
    :gen_server.call(:stacker, :items) 
  end

  def stop do
    :gen_server.cast(:stacker, :stop) 
  end

  # GenServer Callbacks

  def init(stack) do
    { :ok, stack }
  end

  def handle_cast({ :push, item }, stack) do
    { :noreply, [item|stack] }
  end

  def handle_cast(:stop, stack) do
    { :stop, :shutdown, stack }
  end

  def handle_call(:pop, _from, [h|stack]) do
    { :reply, h, stack }
  end

  def handle_call(:items, _from, stack) do
    { :reply, stack, stack }
  end

  def terminate(_reason, _state) do
    :ok
  end

end
