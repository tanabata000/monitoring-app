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
  resources :testers
  resources :companies
  resources :products do
    resources :test_product_infos
  end
  resources :test_product_infos do
    resources :reviews
    resources :review_on_reviews, only: [:index, :new, :create]
  end
end