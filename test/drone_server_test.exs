defmodule DroneServerTest do
  use ExUnit.Case
  alias Groxio.Drone

  test "should return default drone" do
    drone = Drone.new()
    
    server = spawn(fn -> DroneServer.listen(drone) end)
    send(server, {:state, self()})
    received = receive do
      m -> m
    end
    
    assert drone == received
  end  
end
