defmodule MyString do
  def is_ascii_printable?(list) when is_list(list) do
    Enum.all?(list, &(&1 in (? ..?~)))
  end
end
