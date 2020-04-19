Rails.application.routes.draw do


  #顧客側
  devise_for :customers
  root 'items#top'
  get 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :items, only: [:index, :show]
  delete 'cart_items' => 'cart_items#destroy_item', as: "destroy_item"
  resources :cart_items, only:[:index, :create, :destroy, :update]
  resources :orders, only:[:index, :show, :new, :create]
  resources :customers, only:[:show, :edit, :create, :update]
  get 'customers/confirm' => 'customers#confirm'
  resources :addresses, only:[:index, :create, :edit, :update, :destroy]

  #管理側
  devise_for :admins , skip: :all
  devise_scope :admin do
    get 'signin' => 'admins/sessions#new' , as: :new_admin_session
    post  'signin' => 'admins/sessions#create' ,  as: :admin_session
    delete 'logout' => 'admins/sessions#destroy' ,  as: :destroy_admin_session
  end
  namespace :admins do
    get '/top'=>'top#top'
    resources :items
    resources :genres, only:[:index, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    patch 'admins/order_items/:id' => 'order_items#update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
