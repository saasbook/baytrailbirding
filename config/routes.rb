Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
  get '/locations', to: 'application#show'
  get '/tips', to: 'application#tips'
  get '/ebird/birds', to: 'ebird#birds'
  get '/ebird/bird', to: 'ebird#bird'
  get '/ebird/hotspots', to: 'ebird#hotspots'
  get '/donation', to: 'application#donation'
end
