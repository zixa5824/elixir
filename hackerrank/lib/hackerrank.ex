defmodule Hackerrank do
  #Purpose of this module is to store basic code snippets that was learnt from HackerRank site
  # C1 : Challenge One
  def hackerrankC1() do
    a = IO.gets("") |> String.trim
    b = IO.gets("") |> String.trim
    a = String.to_integer(a)
    b = String.to_integer(b)
    IO.puts(a+b)
  end

end
