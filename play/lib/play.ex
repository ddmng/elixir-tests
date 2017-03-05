defmodule Play do
  import Stack

  @moduledoc """
  Documentation for Play.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Play.hello
      :world

  """
  def hello do
    :world
  end


  # Start the server
  {:ok, pid} = Stack.start_link([:first])

  # This is the client
  Stack.pop(pid)
  #=> :hello

  Stack.push(pid, :world)
  #=> :ok

  Stack.pop(pid)
  #=> :world
end
