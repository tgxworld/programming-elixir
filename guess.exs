defmodule Chop do
  def guess(actual, first..last) when (first == actual or last == actual) do
    IO.puts "The number is #{actual}"
  end

  def guess(actual, first..last) when (actual > last or actual < first) do
    # Do nothing
  end

  def guess(actual, first..last) do
    mid = div(last + first, 2)

    IO.puts "Is it #{mid}"

    guess(actual, first..mid)
    guess(actual, (mid+1)..last)
  end
end
