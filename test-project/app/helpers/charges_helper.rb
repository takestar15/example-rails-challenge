module ChargesHelper
  def charge_amount(charge)
    number_to_currency(charge.amount / 100, unit: charge.unit)
  end
end
