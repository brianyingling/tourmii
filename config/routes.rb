Tourmii::Application.routes.draw do
  root :to=>'home#welcome'
  resources :users, :steps
  resources :tours do
    member do
      post 'purchase'
    end
  end

  get '/home'         => 'home#index'
  get '/search/new'   => 'searches#new'
  get 'search/query'  => 'searches#query'
  get '/login'        => 'session#new'
  post '/login'       => 'session#create'
  delete '/login'     => 'session#destroy'

  match "*all" => "application#cors_preflight_check", :constraints => {:method => "OPTIONS"}

end
