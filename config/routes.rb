Rails.application.routes.draw do
  resources :tags
  resources :prompts
  scope :api do
    resources :users
    post 'register', to: 'authentications#register'
    post 'login',    to: 'authentications#login'
  end
end
