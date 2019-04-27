defmodule DroneTest do
  use ExUnit.Case
  alias Groxio.Drone

  test "new returns defaults" do
    assert Drone.new().orientation == :north
    assert Drone.new().position == {0,0,0}
    assert Drone.new().moves == []
  end
  
  test "should turn" do
    assert Drone.turn(:north, ?l) == :west
    assert Drone.turn(:north, ?r) == :east
    assert Drone.turn(:north, ?u) == :north
  end
  
  test "should shift points on forward" do
    assert Drone.forward(:north, {0,0,0}, ?f) == {0,1,0}
    assert Drone.forward(:south, {0,0,0}, ?f) == {0,-1,0}
    assert Drone.forward(:south, {0,0,0}, ?u) == {0,0,1}
    assert Drone.forward(:south, {0,0,0}, ?d) == {0,0,-1}
  end
  
  test "should move drone" do
    actual = 
      Drone.new()
      |> Drone.move(?u)
      |> Drone.move(?u)
      |> Drone.move(?r)
      |> Drone.move(?r)
      |> Drone.move(?f)
      |> Drone.move(?f)

    assert actual.position == {0, -2, 2}
    assert actual.orientation == :south
    assert Enum.count(actual.moves) == 6


  end
  
  
end
