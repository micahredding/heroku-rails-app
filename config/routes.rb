Rails.application.routes.draw do
  devise_for :users

  resources :teams do
    resources :channels
  end
  root 'welcome#home'
end
