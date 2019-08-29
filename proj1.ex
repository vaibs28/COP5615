defmodule Proj1 do
  def start(_args,_type) do
    startTime = System.monotonic_time(:millisecond)
    printBetweenN1andN2()
    endTime = System.monotonic_time(:millisecond);
    IO.puts(endTime-startTime)
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def printHello do
    IO.puts "hello"
    args = System.argv;
    IO.puts(args)
  end

  def lengthOfInt(n) do
    n |> Integer.to_string() |> String.length()
  end

  def fangCheck(n,f1,f2) do
    if ( lengthOfInt(f1)!= lengthOfInt(n)/2 || lengthOfInt(f2)!= lengthOfInt(n)/2) do
      []
    end
    originalDigits = String.codepoints(Integer.to_string(n))
    originalSorted = Enum.sort(originalDigits)
    f1 = Integer.to_string(f1)
    f2 = Integer.to_string(f2)
    fangs = f1<>f2
    fangs = String.to_integer(fangs)
    fangDigits = String.codepoints(Integer.to_string(fangs))
    fangSorted = Enum.sort(fangDigits)
    if originalSorted == fangSorted do
      true
    end
  end

  def printBetweenN1andN2() do
    n1 = 100000
    n2 = 200000
    Enum.each(n1..n2,fn(s)-> printVampireNumbers(s) end)
  end
  def printVampireNumbers(n1) do
    start = n1
    len = String.length(Integer.to_string(start))
    if rem(len,2)===0 do
      fangLength = div(len,2)
      low = :math.pow(10,fangLength-1)
      low = round(low)
      high = :math.sqrt(start)
      high = round(high)
      #range = low..high
      Enum.each(low..high,fn (fang1) ->
        if rem(start,fang1) === 0 do
          fang2 = div(start, fang1)
          case fangCheck(start,fang1,fang2) do
            nil ->  []
            true -> IO.puts"#{start} is a vampire number with #{fang1} and #{fang2}"
          end
        end
      end)
    end


  end



end

