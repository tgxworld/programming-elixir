defmodule MyString do
  # Solution 1
  def capitalize_sentences(string) do
    String.split(string, ". ")
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join(". ")
  end

  # Solution 2 using recursion
  def capitalize_sentences(string), do: _capitalize_sentences(String.capitalize(string))
  def _capitalize_sentences(<<>>), do: ""
  def _capitalize_sentences(<< ". ", tail :: binary >>) do
    << ". " >> <> _capitalize_sentences(String.capitalize(tail))
  end
  def _capitalize_sentences(<< head :: utf8, tail :: binary >>) do
    << head >> <> _capitalize_sentences(tail)
  end
end
