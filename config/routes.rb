Rails.application.routes.draw do
  resources :loans, defaults: {format: :json} do
    resources :payments, only: %i[index show create]
  end
end
