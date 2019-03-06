Rails.application.routes.draw do
  resources :shops
  root "shops#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
