Rails.application.routes.draw do
  scope :api do
    resources :fills
    resources :tags
    resources :prompts
    resources :prompts
    resources :comments
    resources :users, param: :username
    get 'tags/:tag_id/prompts', to: 'prompts#index_by_tag'
    get 'tags/:tag_id/fills', to: 'fills#index_by_tag'
    get 'prompts/:prompt_id/fills', to: 'fills#index_by_prompt'
    get 'prompts/:prompt_id/fills/:fill_id', to: 'fills#fill_for_prompt'
    get 'users/:user_id/fills', to: 'fills#index_by_user'
    get 'users/:user_id/prompts', to: 'prompts#index_by_user'
    post 'register', to: 'authentications#register'
    post 'login',    to: 'authentications#login'
  end
end
