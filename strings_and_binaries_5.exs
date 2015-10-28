defmodule MyString do
  def center(strings) do
    max_length = strings
    |> Enum.map(&String.length(&1))
    |> Enum.max

    strings
    |> Enum.each(&center_one_string(&1, max_length))
  end

  defp center_one_string(string, field_width) do
    padding = div(field_width - String.length(string), 2)
    IO.puts ~s(#{String.duplicate(" ", padding)}#{string}#{String.duplicate(" ", padding)})
  end
end
