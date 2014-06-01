OutThere::Application.routes.draw do
  resources :ideas, only: [:index, :create, :show] do
    post :vote, on: :member
  end

  root to: 'ideas#review'
end
