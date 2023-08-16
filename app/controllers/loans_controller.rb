class LoansController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Loan.all, each_serializer: LoanSerializer
  end

  def show
    render json: Loan.find(params[:id]), serializer: LoanSerializer
  end
end
