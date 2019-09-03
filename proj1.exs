# Reading the command line arguments and passing them to the worker
[low, high] = Enum.map(System.argv(), fn x -> String.to_integer(x) end)
ProjSupervisor.start_link([low, high])
