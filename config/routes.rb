OutThere::Application.routes.draw do
  resources :ideas, only: [:index, :create, :show], defaults: { format: 'json' } do
    post :vote, on: :member
  end

  root to: 'ideas#index'
end
