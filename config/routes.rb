Rails.application.routes.draw do
  scope :api do
    resources :fills
    resources :tags
    resources :prompts
    resources :users, param: :username
    get 'users/:user_id/fills', to: 'fills#fills_user'
    get 'users/:user_id/prompts', to: 'prompts#prompts_user'
    post 'register', to: 'authentications#register'
    post 'login',    to: 'authentications#login'
  end
end
