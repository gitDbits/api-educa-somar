Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, except: %i[destroy]
      resources :institutions
      resources :regions, only: %i[index show]
      resources :states, only: %i[index show] do 
        member do 
          get 'cities'
        end
      end
      resources :cities, only: %i[index show] do
        collection do
          get 'capital'
        end
      end

      post '/auth/login', to: 'authentication#login'
      get '/*a', to: 'application#not_found'
    end
  end
end
