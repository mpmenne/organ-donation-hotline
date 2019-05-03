Rails.application.routes.draw do
  get '/sign_up', to: 'sign_up#new'
  post '/sign_up', to: 'sign_up#create'
  root 'home#index'
  namespace 'api' do
    namespace 'v1' do
      resources :incoming_calls, except: [:index, :new, :update, :show, :destroy]
    end
  end
  get '/dashboard/(:phone_number)', to: 'dashboard#show'
end
