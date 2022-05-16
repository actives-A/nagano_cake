Rails.application.routes.draw do


 devise_for :administrator, skip: [:registrations, :passwords] ,controllers: {
  sessions: "administrator/sessions"
 }
  devise_for :customers
end
