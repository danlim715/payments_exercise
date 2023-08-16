class PaymentsController < ActionController::API
  before_action :find_loan

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: @loan.payments, each_serializer: PaymentSerializer
  end

  def show
    render json: Payment.find(params[:id]), serializer: PaymentSerializer, show_loan_data: true
  end

  def create
    payment = @loan.payments.new(create_params)
    if payment.save
      render json: payment, serializer: PaymentSerializer, show_loan_data: true
    else
      render json: { errors: payment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(:loan_id, :payment_amount, :payment_date)
  end

  def find_loan
    @loan ||= Loan.find(params[:loan_id])
  end
end
