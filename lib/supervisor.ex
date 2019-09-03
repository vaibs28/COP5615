defmodule ProjSupervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(param) do
    children = [worker(Worker, [])]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
