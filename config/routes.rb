Rails.application.routes.draw do
  root 'home#top'
  get    '/users',   to: 'users#index'
  get    'users/:id' => 'users#show'
end
