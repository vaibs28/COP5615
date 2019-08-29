defmodule proj do
  def start(_args,_type) do
    Proj1.printHello()
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
