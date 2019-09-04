defmodule App do
  use Application

  def start(_type, _args) do
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
    ProjSupervisor.start_link([100000,200000])
  end

end
