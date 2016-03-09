defmodule Sequence.Stack do
  use GenServer

  def handle_call(:pop, _from, current_stack) do
    [ head | tail ] = current_stack
    { :reply, head, tail }
  end
end
