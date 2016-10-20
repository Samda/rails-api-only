Rails.application.routes.draw do
  root to: 'home#index'
  scope 'api', defaults: { format: [:json, :xml] } do 
    resources :todos, format: :json
  end
end
