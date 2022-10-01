defmodule RRPResponseParser.Implementation do
  @moduledoc false

  # parsec:RRPResponseParser.Implementation
  import NimbleParsec
  alias RRPResponseParser.Utils

  status =
    ignore(string("code = "))
    |> integer(3)
    |> unwrap_and_tag(:status_code)

  description =
    ignore(string("description = "))
    |> ascii_string([not: ?\n], min: 1)
    |> unwrap_and_tag(:description)

  queuetime =
    ignore(string("queuetime = "))
    |> ascii_string([?0..?9, ?.], min: 1)
    |> map({Utils, :parse_float, []})
    |> unwrap_and_tag(:queuetime)

  runtime =
    ignore(string("runtime = "))
    |> ascii_string([?0..?9, ?.], min: 1)
    |> map({Utils, :parse_float, []})
    |> unwrap_and_tag(:runtime)

  property =
    ignore(string("property["))
    |> ascii_string([?a..?z, ?A..?Z, ?-, ?\s], min: 1)
    |> ignore(string("]["))
    |> integer(min: 1, max: 2)
    |> ignore(string("]"))
    |> ignore(string(" = "))
    |> ascii_string([not: ?\n], min: 1)
    |> tag(:property)

  defparsec(
    :parse,
    choice([
      ignore(string("[RESPONSE]")),
      status,
      description,
      property,
      runtime,
      queuetime,
      ignore(ascii_string([?\n], min: 1)),
      ignore(string("EOF"))
    ])
    |> repeat()
  )

  # parsec:RRPResponseParser.Implementation
end
