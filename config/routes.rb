Rails.application.routes.draw do

  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/edit'
  devise_for :users
  root "homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search"
  get "chat/:id" => "chats#show", as: "chat"

  resources :users do
    resource :relationships, only:[:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :books do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end

  resources :chats, only:[:create]
  resources :groups do
    get "join" => "groups#join"
  end
end
