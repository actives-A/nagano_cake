Rails.application.routes.draw do
  namespace :administrator do
    resources :items ,only: [:index,:show,:new,:edit,:create,:update]
  end
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
