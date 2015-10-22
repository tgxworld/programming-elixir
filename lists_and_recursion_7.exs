defmodule MyList do
  def span(from, to) when from > to do
    []
  end
  def span(from, to) do
    [from | span(from + 1, to)]
  end

  def primes_up_to(n) do
    for x <- span(2, n), is_prime(x), do: x
  end

  def is_prime(x) when x <= 2, do: false
  def is_prime(x) do
    Enum.all?(span(2, x- 1), &(rem(x, &1) != 0))
  end
end


