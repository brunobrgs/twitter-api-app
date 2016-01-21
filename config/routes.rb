Rails.application.routes.draw do
  devise_for :users
  get 'tweets', to: 'home#tweets'
  root 'home#index'
end
