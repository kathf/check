Rails.application.routes.draw do

  devise_for :users
  resources :lists do
    collection do
      get :due_this_week
    end
    resources :tasks do
      collection do
        get :completed_index
      end
      member do
        post :complete
      end
      resources :categories
    end
  end
  root "lists#index"
end
