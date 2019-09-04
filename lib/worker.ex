defmodule Worker do
  use GenServer

  def start_link(low, high) do
    IO.puts("in start_link" <> "#{low}" <> " " <> "#{high}")
    GenServer.start_link(__MODULE__, [low, high])
  end

  def init(low, high) do
    printVampireNumbers(low, high)
  end

  def start_link() do
  end

  def printVampireNumbers(n1, n2) do
    Enum.each(
      n1..n2,
      fn s -> getVampireNumbers(s) end
    )
  end

  def getVampireNumbers(n1) do
    start = n1
    len = String.length(Integer.to_string(start))

    if rem(len, 2) === 0 do
      fangLength = div(len, 2)
      low = :math.pow(10, fangLength - 1)
      low = round(low)
      high = :math.sqrt(start)
      high = round(high)

      Enum.each(low..high, fn fang1 ->
        {a, b} = getFangs(start, fang1)

        case a do
          :ok ->
            # b

            IO.puts("#{start}" <> " " <> "#{b}")

          :error ->
            []
        end
      end)
    end
  end

  def getFangs(start, fang1) do
    error_return = {:error, ""}

    if rem(start, fang1) === 0 do
      fang2 = div(start, fang1)

      if fangCheck(start, fang1, fang2) == true do
        result = Integer.to_string(fang1) <> " " <> Integer.to_string(fang2)
        {:ok, result}
      else
        error_return
      end
    else
      error_return
    end
  end

  def fangCheck(n, f1, f2) do
    if lengthOfInt(f1) != lengthOfInt(n) / 2 || lengthOfInt(f2) != lengthOfInt(n) / 2 ||
         (rem(f1, 10) === 0 && rem(f2, 10) === 0) do
      []
    end

    if rem(f1, 10) == 0 && rem(f2, 10) == 0 do
      false
    else
      originalDigits = String.codepoints(Integer.to_string(n))
      originalSorted = Enum.sort(originalDigits)
      f1 = Integer.to_string(f1)
      f2 = Integer.to_string(f2)
      fangs = f1 <> f2
      fangs = String.to_integer(fangs)
      fangDigits = String.codepoints(Integer.to_string(fangs))
      fangSorted = Enum.sort(fangDigits)

      if originalSorted == fangSorted do
        true
      end
    end
  end

  def lengthOfInt(n) do
    n |> Integer.to_string() |> String.length()
  end
end
