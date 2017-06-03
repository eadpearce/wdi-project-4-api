Rails.application.routes.draw do
  scope :api do
    resources :fills
    resources :tags
    resources :prompts
    resources :users
    post 'register', to: 'authentications#register'
    post 'login',    to: 'authentications#login'
  end
end
