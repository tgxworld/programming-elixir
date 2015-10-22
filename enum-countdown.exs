defmodule Countdown do
  def sleep(seconds) do
    receive do
      after seconds * 1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('espeak #{text}') end
  end

  def timer do
    Stream.resource(
      fn -> {_h, _m, s} = :erlang.time
        60 - s - 1
      end,
      fn
        0 ->
          {:halt, 0}
        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,
      fn _ -> end
    )
  end
end
