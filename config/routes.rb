Contacts::Application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: :index
    member do
      get 'favorites' => 'favorites#index'
      patch 'favorites/:type/:fav_id' => 'favorites#update'
    end
  end

  resources :contacts, only: [:create, :destroy, :show, :update]
  resources :contact_shares, only: [:create, :destroy]

  resources :comments, only: :index

  resources :groups, only: [:index, :show]
end
