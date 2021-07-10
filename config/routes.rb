Rails.application.routes.draw do
  # root to: 'devise/sessions#new'
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  resources :events
  devise_for :users
end
