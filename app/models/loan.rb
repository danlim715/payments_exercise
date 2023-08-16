class Loan < ActiveRecord::Base
  has_many :payments
  validates :funded_amount, presence: true

  def outstanding_balance
    payment_total = payments.sum(:payment_amount)
    funded_amount - payment_total
  end
end
