Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :teams do
    resources :channels do
      resources :messages
    end
  end

  root 'welcome#home'
end
