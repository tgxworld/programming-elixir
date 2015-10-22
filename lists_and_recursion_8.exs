defmodule TaxRobot do
  @tax_rates [NC: 0.075, TX: 0.08]

  def include_tax(orders) do
    for x <- orders do
      if Keyword.has_key?(@tax_rates, x[:ship_to]) do
        Keyword.put(x, :total_amount, x[:net_amount] * (1 + @tax_rates[x[:ship_to]]))
      else
        Keyword.put(x, :total_amount, x[:net_amount])
      end
    end
  end
end

orders = [
  [id: 123, ship_to: :NC, net_amount: 100.00],
  [id: 124, ship_to: :TX, net_amount: 35.50],
  [id: 125, ship_to: :BA, net_amount: 50.00]
]

IO.puts inspect(TaxRobot.include_tax(orders))
