Rails.application.routes.draw do
  resources :posts
  root 'web_pages#home'
  get '/about', to: 'web_pages#about' 
end
