require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should validate_presence_of(:loan) }
  it { should validate_presence_of(:payment_amount) }

  let(:loan) { Loan.create!(funded_amount: 100) }
  
  describe '#valid_amount?' do
    it 'raises an error if payment amount exceeds outstanding balance' do
      payment = loan.payments.create(payment_amount: 1000.0)

      expect(payment.valid?).to be false
      payment.errors.full_messages.should include('Payment amount must not exceed the current outstanding balance')
    end
  end
end