Rails.application.routes.draw do
  root 'home#index'
  namespace 'api' do
    namespace 'v1' do
      resources :incoming_calls, except: [:index, :new, :update, :show, :destroy]
    end
  end
  get '/dashboard/(:phone_number)', to: 'dashboard#show'
end
