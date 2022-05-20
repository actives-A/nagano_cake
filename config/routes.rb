Rails.application.routes.draw do


  root "customer/items#top"
  get "/about" => "customer/items#about"

  namespace :administrator do
    resources :orders ,only:[:index,:show,:update]
    resources :order_items,only:[:update]
  end


  scope module: :customer do
    get "orders/complete" => "customer/orders#complete"
    resources :orders,only:[:new,:create, :index, :show]
    post "orders/confirm"
    delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :items ,only:[:index,:show]
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

  devise_for :customer,controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }


  scope module: :customer do
    resource :customers, only: [:show, :edit, :update]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
