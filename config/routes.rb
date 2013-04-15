Tourmii::Application.routes.draw do
  root :to=>'home#index'
  resources :users, :tours

  get '/search/new'   => 'searches#new'
  get 'search/query'  => 'searches#query'

  get '/login'        => 'session#new'
  post '/login'       => 'session#create'
  delete '/login'     => 'session#destroy'
end
