File.read!("day1_part_one.txt")
|> String.split("\n")
|> Enum.map(&String.split(&1, "", trim: true))
|> Enum.map(
  &Enum.flat_map(
    &1,
    fn x ->
      case Integer.parse(x) do
        {int, _} -> [int]
        :error -> []
      end
    end
  )
)
|> Enum.map(fn x ->
  first = List.first(x) |> Integer.to_string()
  last = List.last(x) |> Integer.to_string()
  first <> last
end)
|> Enum.map(&String.to_integer/1)
|> Enum.sum()
|> IO.inspect()
