defmodule RRPResponseParser.Utils do
  def parse_float(el) do
    el
    |> Float.parse()
    |> elem(0)
  end
end
