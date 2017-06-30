Rails.application.routes.draw do
  root 'users#home'
  get    '/signup',    to: 'users#new'
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  get    '/project',   to: 'projects#new'
  post   '/project',   to: 'projects#create'
  delete '/project',   to: 'projects#destroy'
  resources:users
  resources:projects, only: [:create, :destroy]
end
