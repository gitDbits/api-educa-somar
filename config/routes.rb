Rails.application.routes.draw do
  resources :users, param: :_email, only: [:create, :index, :show]
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
