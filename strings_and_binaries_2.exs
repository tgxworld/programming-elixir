defmodule MyString do
  def anagram?(word1, word2) do
    Enum.sort(to_char_list(word1)) == Enum.sort(to_char_list(word2))
  end
end
