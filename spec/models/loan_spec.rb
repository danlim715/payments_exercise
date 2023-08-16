require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { should validate_presence_of(:funded_amount) }

  describe '#outstanding_balance' do
    let(:loan) { Loan.create!(funded_amount: 100) }
    it 'correctly calculates the outstanding balance' do
      loan.payments.create(payment_amount: 10.0)
      loan.payments.create(payment_amount: 25.0)

      expect(loan.outstanding_balance).to eq(65.0)
    end
  end
end