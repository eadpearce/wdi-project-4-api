Rails.application.routes.draw do
  scope :api do
    resources :fills
    resources :tags
    resources :prompts
    resources :users, param: :username
    get 'prompts/:prompt_id/fills', to: 'fills#fills_for_prompt'
    get 'prompts/:prompt_id/fills/:fill_id', to: 'fills#fill_for_prompt'
    get 'users/:user_id/fills', to: 'fills#fills_for_user'
    get 'users/:user_id/prompts', to: 'prompts#prompts_for_user'
    post 'register', to: 'authentications#register'
    post 'login',    to: 'authentications#login'
  end
end
