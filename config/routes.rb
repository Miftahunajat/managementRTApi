Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :arisans
      resources :arisans_users
      resources :iurans
      resources :user_bayar_arisans
      resources :pengungumen
      resources :pengeluarans
      resources :list_pengeluarans
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
    get '/iuran_sosial_sampah', to: 'user#iuran_sosial_sampah'
    post '/update_iuran', to: 'user#update_iuran'
    get '/all_arisan_daftar_ikut', to: 'user#all_arisan_daftar_ikut'
    get '/keluarga', to: 'user#keluarga'
  end
  get '/all_kk_user', to: 'user#all_kk_user'
  get '/all_kk_user_with_iuran', to: 'user#all_kk_user_with_iuran'

  resources :arisan do
    get '/all_user', to: 'arisan#all_user_status'
    post '/daftar_arisan', to: 'arisan#daftar_arisan'
    post '/ikut_arisan', to: 'arisan#ikut_arisan'
    post '/tarik_arisan', to: 'arisan#tarik_arisan'
    get '/detail_user_status', to: 'arisan#detail_user_status'
  end
  resources :tahun

  resources :arisans
  resources :arisans_user do
    post '/update_arisan', to: 'arisans_user#update_arisan'
  end

  resources :harga_iuran
  resources :pengunguman
  resources :list_pengeluaran

  get '/pengeluaran_per_tahun', to: 'pengeluaran#pengeluaran_per_tahun'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
