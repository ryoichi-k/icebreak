Rails.application.routes.draw do
  root 'home#top'
  post "users/create" => "users#create"
  get    'signup' => 'users#new'
  get "login" => "users#login_form"
  post "login" => "users#login"
  get    'users'=>'users#index'
  get    'users/:id' => 'users#show'
  get "users/:id/edit"=>"users#edit"
  post"users/:id/update"=>"users#update"
  post "logout"=>"users#logout"

  get "icebreak"=> "icebreaks#index"
  get "icebreak/:id"=> "icebreaks#show"
  
end
