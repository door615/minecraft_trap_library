Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  get '/about', to: 'web_pages#about' 
  get '/search_page', to: "web_pages#search_page"
  get 'search', to: 'web_pages#search'
  get "auth", to: "auths#auth"
  post 'login', to: 'auths#login'
  get '/ttt', to: 'web_pages#ttt'
  get '/creeper', to: 'web_pages#creeper'
  get '/golem', to: 'web_pages#golem'
  get '/java', to: 'web_pages#java'
  get '/bedrock', to: 'web_pages#bedrock'
  get '/java_BE', to: 'web_pages#java_BE'
  get '/new_pages', to: 'web_pages#new_posts'
  get '/contact', to: 'web_pages#contact'
  get '/add_tag', to: 'posts#add_tag'
  post 'add_tag', to: 'posts#create_tag'
  get '/edit_tag', to: 'posts#edit_tag'
  patch 'edit_tag', to: 'posts#update_tag'
  get '/privacy', to: 'web_pages#privacy'
  get '/riyoukiyaku', to: 'web_pages#riyoukiyaku'
end
