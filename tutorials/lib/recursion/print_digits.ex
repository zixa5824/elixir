defmodule Tutorials.Recursion.PrintDigits do
  # Base Case
  def upto(0), do: 0
  def upto(nums) do
    nums + upto(nums-1)
  end
end
