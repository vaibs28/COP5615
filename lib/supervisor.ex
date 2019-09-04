defmodule ProjSupervisor do
  use Supervisor

  def start_link([low,high]) do
    IO.puts("#{low}")
    Supervisor.start_link(__MODULE__, [low,high])
  end

  # runs implicitly when calling start_link()
  def init([low, high]) do
    # calling Worker module
    IO.puts("in supervisor init")
    chunkSize = div(high - low, 4)
    range = 0..3

    # children = [worker(Worker, [])]

    Enum.map(range, fn s ->
      spawn_link(Worker, :init, [low + s * chunkSize, low + (s + 1) * chunkSize, s])
    end)

    :timer.sleep(5_000)

    # supervise(children, strategy: :one_for_one)

  end
end
