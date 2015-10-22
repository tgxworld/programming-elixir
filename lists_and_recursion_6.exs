defmodule MyList do
  def flatten([]), do: []
  def flatten([head | tail]) do
    Enum.concat(flatten(head), flatten(tail))
  end
  def flatten(element), do: [element]
end
