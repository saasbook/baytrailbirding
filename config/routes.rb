Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
  get '/locations', to: 'application#show'
  get '/tips', to: 'application#tips'
  post '/ebird', to: 'ebird#data'
  get '/ebird', to: 'ebird#data'
  get '/donation', to: 'application#donation'
end
