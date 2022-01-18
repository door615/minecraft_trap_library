Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  get '/about', to: 'web_pages#about' 
  get '/search_page', to: "web_pages#search_page"
  get 'search', to: 'web_pages#search'
  get "auth", to: "auths#auth"
  post 'login', to: 'auths#login'
end
