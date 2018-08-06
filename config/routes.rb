Rails.application.routes.draw do
  get 'contact', to: "contact#index", as: 'contact'

  get 'about', to: "about#index", as: 'about'

	root 'home#index', as: 'home'

  resources :bikes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
