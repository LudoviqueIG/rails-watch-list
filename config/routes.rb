Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :lists, only: [:index, :show, :new, :create] do
  #   resources :movies, only: [:create]
  #   resources :bookmarks, only: [:destroy, :new, :create]
  # end

  root to: "lists#index"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy

end
