defmodule Ex3 do
  import :timer, only: [sleep: 1]

  def send_to_parent(parent) do
    send parent, "Hello"
    exit "Thats it"
    # raise "Thats it"
  end

  def receive_messages do
    receive do
      msg ->
        IO.puts "Received #{inspect msg}"
        receive_messages
    after 0 ->
      IO.puts "Seems like there is nothing to do"
    end
  end

  def run do
    Process.flag(:trap_exit, true)
    # res = spawn_link(Ex3, :send_to_parent, [self])
    res = spawn_monitor(Ex3, :send_to_parent, [self])
    IO.puts inspect res
    sleep 500
    receive_messages
  end
end

Ex3.run
