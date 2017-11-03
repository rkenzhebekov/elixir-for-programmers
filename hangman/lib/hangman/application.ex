defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Hangman.Server, []),
      worker(Hangman.StatAgent, []),
    ]

    options = [
      name: Hangman.Supervisor,
      strategy: :one_for_one,
    ]

    Supervisor.start_link(children, options)
  end
end
