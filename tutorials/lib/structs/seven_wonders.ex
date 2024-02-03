defmodule Tutorials.Structs.SevenWonders do
  defstruct name: "", country: ""
  alias Tutorials.Structs.SevenWonders
  @type t :: %SevenWonders{
    name: String.t(),
    country: String.t()
  }
 #----------------ALL-----------------
  @spec all() :: [t()]
  def all() do
    [
      %SevenWonders{name: "Pyramids", country: "Egypt"},
      %SevenWonders{name: "The Great Wall of China", country: "China"},
      %SevenWonders{name: "Big Ben", country: "England"},
      %SevenWonders{name: "Colussum", country: "Italy"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Taj el Mahal", country: "India"},
      %SevenWonders{name: "Petra", country: "Jordan"}
    ]
  end

  @spec print_names([t()]) :: :ok
  def print_names(wonders) do
    Enum.each(wonders, fn %{name: name} -> IO.puts(name) end)
  end

  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, country) do
    wonders
    |> Enum.filter(fn %{country: country1} -> country1==country end)
  end

  @spec in_countries_starting_with_i([t()]) :: list(t())
  def in_countries_starting_with_i(wonders) do
    wonders
    |> Enum.filter(fn %{country: country} -> String.starts_with?(country, "E") end)
  end
end
