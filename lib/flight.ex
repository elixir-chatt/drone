defmodule Flight do
  alias Groxio.DroneServer
  
  @moduledoc """
  Documentation for Flight.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Flight.hello()
      :world

  """
  def start(initial \\ []), do: DroneServer.start(initial)
  def state(pid), do: DroneServer.state(pid)
  def move(pid, move), do: DroneServer.move(pid, move)
end
