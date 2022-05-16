Rails.application.routes.draw do
  devise_for :customers,controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

resources :addresses


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
