Rails.application.routes.draw do



  
 devise_for :administrator, skip: [:registrations, :passwords] ,controllers: {
  sessions: "administrator/sessions"
 }

  namespace :administrator do
    resources :items ,only: [:index,:show,:new,:edit,:create,:update]
  end

  devise_for :customers,controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

resources :cart_items, only: [:index, :create, :update, :destroy]
delete 'cart_items/:id' => 'cart_items#all_destroy'
resources :addresses


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
