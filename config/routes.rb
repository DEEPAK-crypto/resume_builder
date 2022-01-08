Rails.application.routes.draw do
  get 'sessions/signup'
  root   'home#index'
  get    'edit'    => 'home#edit'
  get    'login'   => 'sessions#new'
  get    'signup'  => 'sessions#signup'
  post   'signup'  => 'sessions#signupsubmit'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'getprofile/' => 'profile#profile'
  resources :profiles , only: [:update]
  resources :educations , only: [:new]
end
