Rails.application.routes.draw do
  get '/registration', to: "registration#new"
  post '/users', to: "registration#create"
  get '/advice', to: "advice#show"
end
