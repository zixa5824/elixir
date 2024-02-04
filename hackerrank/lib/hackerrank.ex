defmodule Hackerrank do
  #Purpose of this module is to store basic code snippets that was learnt from HackerRank site

  # C1 : Challenge One____________
  def hackerrankC1() do
    a = IO.gets("") |> String.trim
    b = IO.gets("") |> String.trim
    a = String.to_integer(a)
    b = String.to_integer(b)
    IO.puts(a+b)
  end
  #------------------------------------

  # C2 : Challenge Two____________
  defp times(0), do: nil
  defp times(n) do
      IO.puts("Hello World")
      times(n-1)
  end
  def run() do
    IO.gets("")
    |> String.trim()
    |> String.to_integer()
    |> times()
  end
  #Hackerrank.run() should be outside of the module if you want it to run immediately after compilling inside hackerrank
  #------------------------------------

end
