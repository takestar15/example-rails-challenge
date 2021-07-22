class Charge < ApplicationRecord
  belongs_to :customer

  CURRENCIES = {
    usd: '$'
  }.freeze

  scope :success, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  def unit
    CURRENCIES[currency.to_sym]
  end
end
