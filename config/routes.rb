Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search"
  get "chat/:id" => "chats#show", as: "chat"
  get "book_search" => "homes#book_search"

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
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
end
