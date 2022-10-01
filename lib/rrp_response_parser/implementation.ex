# Generated from lib/rrp_response_parser/implementation.ex.exs, do not edit.
# Generated at 2022-10-01 08:27:22Z.

defmodule RRPResponseParser.Implementation do
  @moduledoc false

  @doc """
  Parses the given `binary` as parse.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the parse (start position) as `{line, offset_to_start_of_line}`.

  To column where the error occurred can be inferred from `byte_offset - offset_to_start_of_line`.

  ## Options

    * `:byte_offset` - the byte offset for the whole binary, defaults to 0
    * `:line` - the line and the byte offset into that line, defaults to `{1, byte_offset}`
    * `:context` - the initial context value. It will be converted to a map

  """
  @spec parse(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map
  def parse(binary, opts \\ []) when is_binary(binary) do
    context = Map.new(Keyword.get(opts, :context, []))
    byte_offset = Keyword.get(opts, :byte_offset, 0)

    line =
      case Keyword.get(opts, :line, 1) do
        {_, _} = line -> line
        line -> {line, byte_offset}
      end

    case parse__0(binary, [], [], context, line, byte_offset) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp parse__0(rest, acc, stack, context, line, offset) do
    parse__2(rest, [], [{rest, acc, context, line, offset} | stack], context, line, offset)
  end

  defp parse__2(rest, acc, stack, context, line, offset) do
    parse__77(rest, [], [{rest, context, line, offset}, acc | stack], context, line, offset)
  end

  defp parse__4(<<"EOF", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    parse__5(rest, [] ++ acc, stack, context, comb__line, comb__offset + 3)
  end

  defp parse__4(rest, _acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    parse__1(rest, acc, stack, context, line, offset)
  end

  defp parse__5(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__6(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    parse__4(rest, [], stack, context, line, offset)
  end

  defp parse__7(rest, acc, stack, context, line, offset) do
    parse__8(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__8(rest, acc, stack, context, line, offset) do
    parse__9(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__9(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 === 10 do
    parse__10(
      rest,
      acc,
      stack,
      context,
      (
        line = comb__line

        case x0 do
          10 -> {elem(line, 0) + 1, comb__offset + 1}
          _ -> line
        end
      ),
      comb__offset + 1
    )
  end

  defp parse__9(rest, _acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    parse__6(rest, acc, stack, context, line, offset)
  end

  defp parse__10(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 === 10 do
    parse__12(
      rest,
      acc,
      stack,
      context,
      (
        line = comb__line

        case x0 do
          10 -> {elem(line, 0) + 1, comb__offset + 1}
          _ -> line
        end
      ),
      comb__offset + 1
    )
  end

  defp parse__10(rest, acc, stack, context, line, offset) do
    parse__11(rest, acc, stack, context, line, offset)
  end

  defp parse__12(rest, acc, stack, context, line, offset) do
    parse__10(rest, acc, stack, context, line, offset)
  end

  defp parse__11(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc
    parse__13(rest, acc, stack, context, line, offset)
  end

  defp parse__13(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc
    parse__14(rest, [] ++ acc, stack, context, line, offset)
  end

  defp parse__14(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__15(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    parse__7(rest, [], stack, context, line, offset)
  end

  defp parse__16(rest, acc, stack, context, line, offset) do
    parse__17(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__17(rest, acc, stack, context, line, offset) do
    parse__18(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__18(<<"queuetime = ", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    parse__19(rest, [] ++ acc, stack, context, comb__line, comb__offset + 12)
  end

  defp parse__18(rest, _acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    parse__15(rest, acc, stack, context, line, offset)
  end

  defp parse__19(rest, acc, stack, context, line, offset) do
    parse__20(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__20(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when (x0 >= 48 and x0 <= 57) or x0 === 46 do
    parse__21(rest, [<<x0::integer>>] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__20(rest, _acc, stack, context, line, offset) do
    [_, _, acc | stack] = stack
    parse__15(rest, acc, stack, context, line, offset)
  end

  defp parse__21(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when (x0 >= 48 and x0 <= 57) or x0 === 46 do
    parse__23(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__21(rest, acc, stack, context, line, offset) do
    parse__22(rest, acc, stack, context, line, offset)
  end

  defp parse__23(rest, acc, stack, context, line, offset) do
    parse__21(rest, acc, stack, context, line, offset)
  end

  defp parse__22(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__24(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__24(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__25(
      rest,
      Enum.map(user_acc, fn var -> RRPResponseParser.Utils.parse_float(var) end) ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__25(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__26(
      rest,
      [
        queuetime:
          case :lists.reverse(user_acc) do
            [one] -> one
            many -> raise "unwrap_and_tag/3 expected a single token, got: #{inspect(many)}"
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__26(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__27(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    parse__16(rest, [], stack, context, line, offset)
  end

  defp parse__28(rest, acc, stack, context, line, offset) do
    parse__29(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__29(rest, acc, stack, context, line, offset) do
    parse__30(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__30(<<"runtime = ", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    parse__31(rest, [] ++ acc, stack, context, comb__line, comb__offset + 10)
  end

  defp parse__30(rest, _acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    parse__27(rest, acc, stack, context, line, offset)
  end

  defp parse__31(rest, acc, stack, context, line, offset) do
    parse__32(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__32(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when (x0 >= 48 and x0 <= 57) or x0 === 46 do
    parse__33(rest, [<<x0::integer>>] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__32(rest, _acc, stack, context, line, offset) do
    [_, _, acc | stack] = stack
    parse__27(rest, acc, stack, context, line, offset)
  end

  defp parse__33(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when (x0 >= 48 and x0 <= 57) or x0 === 46 do
    parse__35(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__33(rest, acc, stack, context, line, offset) do
    parse__34(rest, acc, stack, context, line, offset)
  end

  defp parse__35(rest, acc, stack, context, line, offset) do
    parse__33(rest, acc, stack, context, line, offset)
  end

  defp parse__34(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__36(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__36(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__37(
      rest,
      Enum.map(user_acc, fn var -> RRPResponseParser.Utils.parse_float(var) end) ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__37(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__38(
      rest,
      [
        runtime:
          case :lists.reverse(user_acc) do
            [one] -> one
            many -> raise "unwrap_and_tag/3 expected a single token, got: #{inspect(many)}"
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__38(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__39(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    parse__28(rest, [], stack, context, line, offset)
  end

  defp parse__40(rest, acc, stack, context, line, offset) do
    parse__41(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__41(<<"property[", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    parse__42(rest, [] ++ acc, stack, context, comb__line, comb__offset + 9)
  end

  defp parse__41(rest, _acc, stack, context, line, offset) do
    [acc | stack] = stack
    parse__39(rest, acc, stack, context, line, offset)
  end

  defp parse__42(rest, acc, stack, context, line, offset) do
    parse__43(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__43(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or x0 === 45 or x0 === 32 do
    parse__44(rest, [<<x0::integer>>] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__43(rest, _acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    parse__39(rest, acc, stack, context, line, offset)
  end

  defp parse__44(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or x0 === 45 or x0 === 32 do
    parse__46(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__44(rest, acc, stack, context, line, offset) do
    parse__45(rest, acc, stack, context, line, offset)
  end

  defp parse__46(rest, acc, stack, context, line, offset) do
    parse__44(rest, acc, stack, context, line, offset)
  end

  defp parse__45(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__47(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__47(<<"][", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    parse__48(rest, [] ++ acc, stack, context, comb__line, comb__offset + 2)
  end

  defp parse__47(rest, _acc, stack, context, line, offset) do
    [acc | stack] = stack
    parse__39(rest, acc, stack, context, line, offset)
  end

  defp parse__48(rest, acc, stack, context, line, offset) do
    parse__49(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__49(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    parse__50(rest, [x0 - 48] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__49(rest, _acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    parse__39(rest, acc, stack, context, line, offset)
  end

  defp parse__50(rest, acc, stack, context, line, offset) do
    parse__52(rest, acc, [1 | stack], context, line, offset)
  end

  defp parse__52(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 >= 48 and x0 <= 57 do
    parse__53(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__52(rest, acc, stack, context, line, offset) do
    parse__51(rest, acc, stack, context, line, offset)
  end

  defp parse__51(rest, acc, [_ | stack], context, line, offset) do
    parse__54(rest, acc, stack, context, line, offset)
  end

  defp parse__53(rest, acc, [1 | stack], context, line, offset) do
    parse__54(rest, acc, stack, context, line, offset)
  end

  defp parse__53(rest, acc, [count | stack], context, line, offset) do
    parse__52(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp parse__54(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__55(
      rest,
      (
        [head | tail] = :lists.reverse(user_acc)
        [:lists.foldl(fn x, acc -> x - 48 + acc * 10 end, head, tail)]
      ) ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__55(<<"]", " = ", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    parse__56(rest, [] ++ acc, stack, context, comb__line, comb__offset + 4)
  end

  defp parse__55(rest, _acc, stack, context, line, offset) do
    [acc | stack] = stack
    parse__39(rest, acc, stack, context, line, offset)
  end

  defp parse__56(rest, acc, stack, context, line, offset) do
    parse__57(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__57(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 !== 10 do
    parse__58(rest, [<<x0::integer>>] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__57(rest, _acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    parse__39(rest, acc, stack, context, line, offset)
  end

  defp parse__58(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 !== 10 do
    parse__60(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__58(rest, acc, stack, context, line, offset) do
    parse__59(rest, acc, stack, context, line, offset)
  end

  defp parse__60(rest, acc, stack, context, line, offset) do
    parse__58(rest, acc, stack, context, line, offset)
  end

  defp parse__59(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__61(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__61(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc
    parse__62(rest, [property: :lists.reverse(user_acc)] ++ acc, stack, context, line, offset)
  end

  defp parse__62(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__63(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    parse__40(rest, [], stack, context, line, offset)
  end

  defp parse__64(rest, acc, stack, context, line, offset) do
    parse__65(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__65(
         <<"description = ", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    parse__66(rest, [] ++ acc, stack, context, comb__line, comb__offset + 14)
  end

  defp parse__65(rest, _acc, stack, context, line, offset) do
    [acc | stack] = stack
    parse__63(rest, acc, stack, context, line, offset)
  end

  defp parse__66(rest, acc, stack, context, line, offset) do
    parse__67(rest, [], [acc | stack], context, line, offset)
  end

  defp parse__67(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 !== 10 do
    parse__68(rest, [<<x0::integer>>] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__67(rest, _acc, stack, context, line, offset) do
    [_, acc | stack] = stack
    parse__63(rest, acc, stack, context, line, offset)
  end

  defp parse__68(<<x0, rest::binary>>, acc, stack, context, comb__line, comb__offset)
       when x0 !== 10 do
    parse__70(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp parse__68(rest, acc, stack, context, line, offset) do
    parse__69(rest, acc, stack, context, line, offset)
  end

  defp parse__70(rest, acc, stack, context, line, offset) do
    parse__68(rest, acc, stack, context, line, offset)
  end

  defp parse__69(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__71(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__71(rest, user_acc, [acc | stack], context, line, offset) do
    _ = user_acc

    parse__72(
      rest,
      [
        description:
          case :lists.reverse(user_acc) do
            [one] -> one
            many -> raise "unwrap_and_tag/3 expected a single token, got: #{inspect(many)}"
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp parse__72(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__73(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    parse__64(rest, [], stack, context, line, offset)
  end

  defp parse__74(
         <<"code = ", x0, x1, x2, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) and (x2 >= 48 and x2 <= 57) do
    parse__75(
      rest,
      [status_code: x2 - 48 + (x1 - 48) * 10 + (x0 - 48) * 100] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 10
    )
  end

  defp parse__74(rest, acc, stack, context, line, offset) do
    parse__73(rest, acc, stack, context, line, offset)
  end

  defp parse__75(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__76(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    parse__74(rest, [], stack, context, line, offset)
  end

  defp parse__77(<<"[RESPONSE]", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    parse__78(rest, [] ++ acc, stack, context, comb__line, comb__offset + 10)
  end

  defp parse__77(rest, acc, stack, context, line, offset) do
    parse__76(rest, acc, stack, context, line, offset)
  end

  defp parse__78(rest, acc, [_, previous_acc | stack], context, line, offset) do
    parse__3(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp parse__1(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    parse__79(rest, acc, stack, context, line, offset)
  end

  defp parse__3(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    _ = {rest, acc, context, line, offset}

    parse__2(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp parse__79(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end
end
