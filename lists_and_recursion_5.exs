defmodule MyList do
  def all?([], func), do: true
  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _function), do: :ok
  def each([head | tail], function) do
    function.(head)
    each(tail, function)
  end

  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(list, count), do: _split(list, {[], []}, count)
  def _split([], tuple, _count), do: tuple
  def _split(list, tuple, 0) do
    {elem(tuple, 0), list}
  end
  def _split([head | tail], tuple, count) do
    _split(tail, {elem(tuple, 0) ++ [head], elem(tuple, 1)}, count - 1)
  end

  def take(list, count), do: _take(list, [], count)
  def _take([], taken_list, _count), do: taken_list
  def _take(list, taken_list, 0), do: taken_list
  def _take([head | tail], taken_list, count) do
    _take(tail, taken_list ++ [head], count - 1)
  end
end
