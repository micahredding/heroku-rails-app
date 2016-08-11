Rails.application.routes.draw do
  devise_for :users

  resources :teams do
    resources :channels do
      resources :messages, only: [:index, :new, :create]
    end
  end
  root 'welcome#home'
end
