#Reading the command line arguments and passing them to the worker
[arg1,arg2] = Enum.map(System.argv,fn x -> String.to_integer(x) end)
Proj1.start()

