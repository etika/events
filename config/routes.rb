Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => 'registrations' ,:sessions => 'sessions'}
  resources :event_categories
  resources :events
  post 'attend_event' => 'events#attend_event', as: 'attend_event'
  #devise_scope :user do
   root to: "users/sessions#new"
   # post '/sign-up' => 'users/registrations#create'
    #post '/sign-in' => 'users/sessions#create'
  #end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
