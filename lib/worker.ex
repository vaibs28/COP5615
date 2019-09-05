defmodule Worker do
  use GenServer

  def init(low, high) do
    Enum.each(
      low..high,
      fn (current) ->
        result = fangs(current)
        if (result != "") do
          IO.puts Integer.to_string(current) <> " " <> result
        end
      end
    )
  end

  def fangs(input) do
    input_as_array = input
                     |> Integer.digits()
                     |> Enum.sort()

    length_of_input = input_as_array
                      |> length

    if (rem(length_of_input, 2) != 0) do
      raise "Input length should be event"
    end

    power = length_of_input / 2 - 1;
    first = round(:math.pow(10, power))
    last = round(:math.sqrt(input))

    first..last
    |> Enum.reduce "", fn current, acc ->
      {a, b} = find_fangs(current, input, input_as_array)

      if (a === :ok) do
        acc <> " " <> b
      else
        acc
      end
    end
  end

  defp find_fangs(fang1, input_as_integer, input_as_array) do
    error_return = {:error, ""}
    if (rem(input_as_integer, fang1) == 0) do
      fang2 = round(input_as_integer / fang1)

      if (rem(fang1, 10) != 0 or rem(fang2, 10) != 0) do
        if (
             fang2
             |> Integer.to_string()
             |> String.length() == (
               input_as_array
               |> length) / 2) do
          current_as_array = fang1
                             |> Integer.digits()
          result_as_array = fang2
                            |> Integer.digits()
          combined = current_as_array ++ result_as_array
                     |> Enum.sort()

          if (input_as_array -- combined
              |> length() == 0) do
            {:ok, Integer.to_string(fang1) <> " " <> Integer.to_string(fang2)}
          else
            error_return
          end
        else
          error_return
        end
      else
        error_return
      end
    else
      error_return
    end
  end
end
