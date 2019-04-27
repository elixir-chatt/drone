defmodule Groxio.DroneServer do
  def start(initial \\ []) do
    drone = Drone.new(initial)
    
    spawn(fn -> run(drone) end)
  end
  
  def move(server, move) do
    send(server, {:move, move})
    :ok
  end
  
  def state(server) do
    send(server, {:state, self()})
    receive do
      drone -> drone
    end
  end
  
  def run(drone) do
    drone
    |> listen
    |> run
  end
  
  def listen(drone) do
    receive do
      {:move, move} -> 
        Drone.move(drone, move)
      {:state, from} -> 
        send(from, drone)
        drone
    end
  end
end