Tourmii::Application.routes.draw do
  root :to=>'home#welcome'
  resources :users, :steps
  resources :tours do
    member do
      post 'purchase'
    end
  end
  get '/search/new'   => 'searches#new'
  get 'search/query'  => 'searches#query'

  get '/login'        => 'session#new'
  post '/login'       => 'session#create'
  delete '/login'     => 'session#destroy'
end
