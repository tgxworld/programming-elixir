defmodule SpawnTwoProcess do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello #{msg}"}
    end
  end
end

pid_1 = spawn(SpawnTwoProcess, :greet, [])
pid_2 = spawn(SpawnTwoProcess, :greet, [])

send pid_1, {self, "Fred"}
send pid_2, {self, "betty"}

receive do
  {:ok, message} ->
    IO.puts message
end

receive do
  {:ok, message} ->
    IO.puts message
end
