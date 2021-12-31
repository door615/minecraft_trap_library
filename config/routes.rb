Rails.application.routes.draw do
  root 'web_pages#home'
  get '/about', to: 'web_pages#about' 
end
