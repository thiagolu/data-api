Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/status', to: 'application#status' 
  post '/import', to: 'application#import'
  put '/integrate_data', to: 'application#integrate_data'
end
