Rails.application.routes.draw do
  resources :items, only: [:index, :show] do
    resources :users, only: [:show]
  end

  resources :users, only: [:show] do
    resources :items 
  end
end
