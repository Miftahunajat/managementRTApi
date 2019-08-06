Rails.application.routes.draw do

  namespace :admin do
      resources :arisans
      resources :arisans_users
      resources :bulans
      resources :iurans
      resources :jenis_kelamins
      resources :roles
      resources :users
      resources :user_bayar_arisans
      resources :tahuns

      root to: "arisans#index"
    end
  # Manual Routes
  post '/login', to: 'user#login'

  # Resources

  resources :test
  resources :user do
    get '/roles', to: 'user#roles'
    get '/all_iuran', to: 'user#all_iuran'
  end
  resources :tahun

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
