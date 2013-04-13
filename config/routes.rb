Tourmii::Application.routes.draw do
  root :to=>'home#index'
  resources :users

  get '/search/new'   => 'searches#new'
  get 'search/query'  => 'search#query'

  get '/login'        => 'session#new'
  post '/login'       => 'session#create'
  delete '/login'     => 'session#destroy'
end
