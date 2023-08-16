require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:loan) { Loan.create!(funded_amount: 100.0) }

  describe '#index' do
    it 'responds with a 200' do
      get :index, params: { loan_id: loan.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:payment) { Payment.create!(payment_amount: 25.0, loan: loan) }
    it 'responds with a 200' do
      get :show, params: { loan_id: loan.id, id: payment.id }
      expect(response).to have_http_status(:ok)
    end

    context 'if the loan is not found' do
      it 'responds with a 404 when payments#index is called' do
        get :index, params: { loan_id: 10000 }
        expect(response).to have_http_status(:not_found)
      end
      it 'responds with a 404 when payments#show is called' do
        get :show, params: { loan_id: 10000, id: payment.id }
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'if the payment is not found' do
      it 'responds with a 404' do
        get :show, params: { loan_id: loan.id, id: 10000 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#create' do
    context 'payment is valid' do
      let(:payment_params) { { loan_id: loan.id, payment_amount: 5.0 } }
      it 'reponds with a 200' do
        post :create, params: payment_params
        expect(response).to have_http_status(:ok)
      end
    end
    context 'payment is not valid' do
      let(:payment_params) { { loan_id: loan.id, payment_amount: 5000.0 } }
      it 'responds with 422' do
        post :create, params: payment_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
