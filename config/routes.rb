Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/destroy'
  root 'web_pages#home'
  get '/about', to: 'web_pages#about' 
end
