Rails.application.routes.draw do

  root "customer/items#top"
  get "/about" => "customer/items#about"

  scope module: :customer do
    resources :addresses
    get "orders/complete" => "orders#complete"
    get "orders/confirm" => "orders#redirect_order_new"
    resources :orders,only:[:new,:create, :index, :show]
    post "orders/confirm"
    delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :items ,only:[:index,:show] do
      collection do
        post :search_items
      end
    end
    resources :genres, only:[:show]
    resource :customers, only: [:show, :edit, :update]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end

  devise_for :customer,skip: [:passwords],controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }


 devise_for :administrator, skip: [:registrations, :passwords] ,controllers: {
  sessions: "administrator/sessions"
 }

  namespace :administrator do
    resources :orders ,only:[:index,:show,:update]
    resources :order_items,only:[:update]
    resources :customers, only: [:index,:show,:edit,:update] do
      member do
        get :search_orders
      end
    end
    resources :genres, only: [:index,:create,:edit,:update]
    resources :items ,only: [:index,:show,:new,:edit,:create,:update] do
      collection do
        post :search_items
      end
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
