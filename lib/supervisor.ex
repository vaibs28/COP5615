defmodule ProjSupervisor do
  use Supervisor

  def start_link([low, high]) do
    Supervisor.start_link(__MODULE__, [low, high])
  end

  # runs implicitly when calling start_link()
  def init([low, high]) do
    chunks = 4
    chunk_size = div(high - low, chunks)
    range = 0..(chunks - 1)

    pids =
      Enum.map(
        range,
        fn s ->
          spawn_link(Worker, :init, [low + s * chunk_size, low + (s + 1) * chunk_size])
        end
      )

    let_it_complete(pids)
  end

  def let_it_complete(pids) do
    if pids
       |> length == 0 do
      nil
    else
      completed_process = Enum.filter(pids, fn pid -> not Process.alive?(pid) end)
      let_it_complete(pids -- completed_process)
    end
  end
end
