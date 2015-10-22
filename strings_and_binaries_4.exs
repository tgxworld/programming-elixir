defmodule Parse do
  def calculate(expression) do
    {num_1, rest} = parse_number(expression)
    rest = skip_spaces(rest)
    {op, rest} = parse_operator(rest)
    rest = skip_spaces(rest)
    {num_2, _} = parse_number(rest)
    op.(num_1, num_2)
  end

  def parse_number(expression), do: _number_digits(expression, 0)
  defp _number_digits([], value), do: { value, [] }
  defp _number_digits([digit | tail], value) when digit in '0123456789' do
    _number_digits(tail, value * 10 + digit - ?0)
  end
  defp _number_digits(expression, value) do
    { value, expression }
  end

  def skip_spaces(expression), do: _skip_spaces(expression)
  defp _skip_spaces([space | tail]) when space == ?  do
    tail
  end
  defp _skip_spaces(expression), do: expression

  def parse_operator([?+ | rest]), do: { &(&1+&2), rest }
  def parse_operator([?- | rest]), do: { &(&1-&2), rest }
  def parse_operator([?* | rest]), do: { &(&1*&2), rest }
  def parse_operator([?/ | rest]), do: { &(div(&1, &2)), rest }
end
