Rails.application.routes.draw do
  get '/registration', to: "registration#new"
end
