Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create]
    collection do
      get 'search'
      get 'query'
    end
  end
end
