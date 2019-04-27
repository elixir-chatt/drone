defmodule Groxio.Drone do
  defstruct [
    position: {0,0,0}, 
    orientation: :north, 
    moves: []
  ]
  
  def new(fields \\ []) do
    __struct__(fields)
  end
  
  def move(drone, move) do
    %{ drone |
      orientation: turn(drone.orientation, move), 
      position: forward(drone.orientation, drone.position, move), 
      moves: [move|drone.moves]
    }
  end
  
  def turn(orientation, ?l) do
    case orientation do
      :north -> :west
      :west -> :south
      :south -> :east
      :east -> :north
    end
  end
  def turn(orientation, ?r) do
    case orientation do
      :north -> :east
      :east -> :south
      :south -> :west
      :west -> :north
    end
  end
  def turn(orientation, _move), do: orientation
  
  def forward(:north, {x, y, z}, ?f), do: {x, y + 1, z}
  def forward(:south, {x, y, z}, ?f), do: {x, y - 1, z}
  def forward(:east, {x, y, z}, ?f), do: {x + 1, y, z}
  def forward(:west, {x, y, z}, ?f), do: {x - 1, y, z}
  def forward(_orientation, {x, y, z}, ?u), do: {x, y, z + 1}
  def forward(_orientation, {x, y, z}, ?d), do: {x, y, z - 1}
  def forward(_orientation, point, _move), do: point
end