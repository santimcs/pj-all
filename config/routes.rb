Rails.application.routes.draw do
  resources :playlists
  resources :channels
  resources :topics
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/javascript", to: 'playlists#javascript'
  get "/deno", to: 'playlists#deno'
  get "/html", to: 'playlists#html'
  get "/python", to: 'playlists#python'
  get "/rails", to: 'playlists#rails'
end
