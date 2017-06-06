Rails.application.routes.draw do
  resources :comments
  scope :api do
    resources :fills
    resources :tags
    resources :prompts
    resources :prompts
    resources :comments
    resources :users, param: :username
    get 'tags/:tag_id/prompts', to: 'prompts#prompts_for_tag'
    get 'prompts/:prompt_id/fills', to: 'fills#fills_for_prompt'
    get 'prompts/:prompt_id/fills/:fill_id', to: 'fills#fill_for_prompt'
    get 'users/:user_id/fills', to: 'fills#fills_for_user'
    get 'users/:user_id/prompts', to: 'prompts#prompts_for_user'
    post 'register', to: 'authentications#register'
    post 'login',    to: 'authentications#login'
  end
end
