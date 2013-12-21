defmodule Stacker do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, stack) do
    Stacker.Supervisor.start_link(stack)
  end
end
