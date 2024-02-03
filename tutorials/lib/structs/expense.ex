defmodule Tutorials.Structs.Expense do
  alias Tutorials.Structs.Expense
  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )

  @type t :: %Expense{
    title: String.t(),
    date: Date.t() | nil,
    amount: number(),
    store: String.t()
  }

  @spec sample() :: [t()]
  def sample do
    [
      %Expense{title: "Grocery", date: ~D[2022-09-12], amount: 18.99, store: "Metro"},
      %Expense{title: "Mobile", date: ~D[2022-10-18], amount: 55.65, store: "Bell"},
      %Expense{title: "Jacket", date: ~D[2022-07-06], amount: 150.99, store: "Marks"},
      %Expense{title: "Air Jordans", date: ~D[2022-10-30], amount: 799.99, store: "Nike"}
    ]
  end

  @spec total_amount_spent([t()]) :: number()
  def total_amount_spent(expenses) do
    #Enum.sum(Enum.map(expenses, &(&1.amount)))
    Enum.reduce(expenses, 0, fn expenses, acc-> expenses.amount + acc end)
  end

  @spec sort_by_date([t()]) :: [t()]
  def sort_by_date(expenses) do
    #Enum.sort(expenses, fn x, y -> x.date < y.date end)
    Enum.sort_by(expenses, &(&1.date))
  end

  @spec add_expense(t()) :: [t()]
  def add_expense(%Expense{} = expense) do
    [expense | sample()]
  end

  def update_expense(title, amount) do
    [item] = Enum.filter(sample(), fn expense -> expense.title == title end)
    new_item = %{item | amount: amount}
    [new_item | sample() |> List.delete(item)]
  end

  @users ["Mohamed", "Ahmed", "Mahmoud", "Salah"] # Constant users through our entire module
  def authenticate(user) when user in @users, do: {:ok, "authorized"}
  def authenticate(_), do: {:error, "unauthorized"}

  def verify_password(user, _password) when user in @users, do: {:ok, "password verified"}
  def verify_password(_, _), do: {:error, "unauthorized"}

  @spec login(any(), any()) :: {:error, <<_::96>>} | {:ok, <<_::64, _::_*8>>}
  def login(user, password) do
    with {:ok, _auth_msg} <- authenticate(user),
    {:ok, _auth_msg} <- verify_password(user, password) do
      {:ok, "#{user} has logged in successfully"}
    else
      {:error, msg} -> {:error, msg}
      _ -> :unauthorized
    end
  end
end
