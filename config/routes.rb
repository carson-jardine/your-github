Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  get '/auth/github', as: :github_login
  get '/repos', to: 'dashboard#show', as: :repos
  get '/auth/github/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
