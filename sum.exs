defmodule Sum do
  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: n + of(n - 1)
end
