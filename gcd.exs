defmodule GCD do
  def of(x, 0) do
    x
  end

  def of(x, y) do
    of(x, rem(x, y))
  end
end
