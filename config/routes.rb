Rails.application.routes.draw do
  root 'events#index'
  get 'events/record' => 'events#record'
  resources :events
end
