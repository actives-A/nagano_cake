Rails.application.routes.draw do

 devise_for :administrator, skip: [:registrations, :passwords] ,controllers: {
  sessions: "administrator/sessions"
 }
  namespace :administrator do
   resources :genres, only: [:index,:create,:edit,:update]
  end

  devise_for :customers
end
