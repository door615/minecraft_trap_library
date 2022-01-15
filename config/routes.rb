Rails.application.routes.draw do
  resources :posts
  root 'web_pages#home'
  get '/about', to: 'web_pages#about' 
  get '/search_page', to: "posts#search_page"
  get 'search', to: 'posts#search'
  get "auth", to: "auths#auth"
end
