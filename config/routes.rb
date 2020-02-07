Rails.application.routes.draw do
  root to: 'welcome#show'
  get     '/registration', to: "registration#new"
  post    '/users', to: "registration#create"
  get     '/advice', to: "advice#show"
  get     '/login', to: "sessions#new"
  post    '/login', to: "sessions#create"
  delete  '/logout', to: "sessions#destroy"
end
