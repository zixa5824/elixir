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

  @spec length_of_country_name([t()]) :: [t()]
  def length_of_country_name(wonders) do
    wonders
    |> Enum.sort(fn x, y -> String.length(x.country) < String.length(y.country) end)
  end

  @spec name_country_list(any()) :: list()
  def name_country_list(wonders) do
    wonders
    |> Enum.reduce([], fn wonder, acc -> [[wonder.name, wonder.country] | acc] end)
    |> Tutorials.Lists.rev
  end

  @spec name_country_Keyword_list(any()) :: list()
  def name_country_Keyword_list(wonders) do
    wonders
    |> Enum.reduce([], fn wonder, acc -> [{String.to_atom(wonder.name), wonder.country} | acc] end)
    |> Tutorials.Lists.rev
  end

  @spec all_names(any()) :: list()
  def all_names(wonders) do
    #Enum.map(wonders, fn %{name: name} -> name end)
    #for %{name: name} <- wonders, do: name
    Enum.map(wonders, &(&1.name))
  end
end
