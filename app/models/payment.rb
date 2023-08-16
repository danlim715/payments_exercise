class Payment < ActiveRecord::Base
  belongs_to :loan

  validates :loan, :payment_amount, presence: true
  validate :valid_amount?, on: :create

  INVALID_PAYMENT_AMOUNT = 'amount must not exceed the current outstanding balance'.freeze

  private
  
  def valid_amount?
    return unless loan.present?

    errors.add(:payment, INVALID_PAYMENT_AMOUNT) if payment_amount > loan.outstanding_balance
  end
end
