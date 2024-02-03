defmodule Tutorials.Lists do
  def sum(nums, acc \\ 0)
  def sum([], acc), do: acc
  def sum([h|t], acc) do
    sum(t, acc+h)
  end

  #_____________________Reverse______________
  @spec rev([any()],[any()])::[any()]
  def rev(nums, acc \\ [])
  def rev([], acc), do: acc
  def rev([h|t], acc), do: rev(t, [h|acc])

  #++++++++++++++Map+++++++++++++++++++
  def map(nums, fun, acc \\ [])
  def map([], _, acc), do: acc |> rev()
  def map([h|t], fun, acc), do: map(t, fun, [fun.(h) | acc])


  #-----------------Concat-------------------
  def concat(src1,src2), do: concat_fun(src1 |> rev, src2)
  defp concat_fun([], src2), do: src2
  defp concat_fun([h|t], src2), do: concat_fun(t, [h|src2])


  #--------------------Flat map--------------------
  def flat_map(src, fun, dst \\ [])
  def flat_map([], _, dst), do: dst
  def flat_map([h|t], fun, dst), do: flat_map(t,fun,concat(dst, fun.(h)))
end
