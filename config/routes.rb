Rails.application.routes.draw do
  # devise設定
  # devise_for :testers
  # devise_for :companies
  # deviseコントローラ
  devise_for :testers, controllers: {
    sessions:      'testers/sessions',
    passwords:     'testers/passwords',
    registrations: 'testers/registrations'
  }
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  

  root to: "products#index"
  resources :products
end
