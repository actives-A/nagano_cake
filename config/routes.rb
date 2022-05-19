Rails.application.routes.draw do

  root "customer/items#top"
  get "/about" => "customer/items#about"

  scope module: :customer do
    resources :orders,only:[:new,:create]
    post "orders/confirm"
    get "orders/complete"
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
    resources :addresses
    resources :items, only: [:top]
  end



 devise_for :administrator, skip: [:registrations, :passwords] ,controllers: {
  sessions: "administrator/sessions"
 }

  namespace :administrator do
    resources :customers, only: [:index,:show,:edit,:update]
  end

  namespace :administrator do
   resources :genres, only: [:index,:create,:edit,:update]
  end

  namespace :administrator do
    resources :items ,only: [:index,:show,:new,:edit,:create,:update]
  end

  devise_for :customers,controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }


resources :customers, only: [:show, :edit, :update]
get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
