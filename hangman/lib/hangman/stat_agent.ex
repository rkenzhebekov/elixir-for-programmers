defmodule Hangman.StatAgent do
  use Agent

  @me __MODULE__

  defstruct(
    count: 0,
    nodes: []
  )

  def start_link() do
    Agent.start_link(fn -> %Hangman.StatAgent{} end, name: @me)
  end

  def count() do
    Agent.get(@me, fn state -> state.count end)
  end

  def increment() do
    Agent.update(@me, fn state -> %{ state | count: state.count + 1 } end)
  end

  def add_node(node) do
    Agent.update(@me, fn state -> %{ state | nodes: [ node | state.nodes ] } end)
  end
end

