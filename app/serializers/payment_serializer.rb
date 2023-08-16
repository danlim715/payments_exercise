class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :payment_amount, :payment_date
  belongs_to :loan, serializer: LoanSerializer, if: :show_loan_data

  def show_loan_data
    @instance_options[:show_loan_data] == true
  end
end
