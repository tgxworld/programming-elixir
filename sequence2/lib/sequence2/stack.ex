defmodule Sequence2.Stack do
  use GenServer

  def start_link(current_stack) do
    GenServer.start_link(__MODULE__, current_stack, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end

  def handle_call(:pop, _from, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_call(:pop, _from, []) do
    { :stop, :shutdown, [] }
  end

  def handle_cast({:push, value}, current_stack) do
    { :noreply, [ value | current_stack ] }
  end

  def terminate(reason, state) do
    IO.puts "#{reason} #{inspect state}"
    :ok
  end
end
