Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "group#index", as: :authenticated_root
  end
  
  unauthenticated :user do
    root "splach#index", as: :unauthenticated_root
  end

  resources :group ,only: [:index,:create,:new] do
    resources :entites ,only: [:index,:create,:new]
  end 
end
