Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :incoming_calls, except: [:index, :new, :update, :show, :destroy]
    end
  end
end
