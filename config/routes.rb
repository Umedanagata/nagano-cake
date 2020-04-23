Rails.application.routes.draw do

  #顧客側
  devise_for :customers
  root 'items#top'
  post 'orders/confirm' => 'orders#confirm', as: "orders_confirm"
  get 'orders/complete' => 'orders#complete', as: "orders_complete"
  resources :items, only: [:index, :show]
  get 'genre_items/:id' => "items#genre_items", as: "genre_items"
  delete 'cart_items' => 'cart_items#destroy_item', as: "destroy_item"
  resources :cart_items, only:[:index, :create, :destroy, :update]
  resources :orders, only:[:index, :show, :new, :create]
  get 'customers/confirm' => 'customers#confirm'
  resources :customers, only:[:show, :edit, :create, :update, :destroy]
  resources :addresses, only:[:index, :create, :edit, :update, :destroy]

  #管理側
  devise_for :admins , skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new' , as: :new_admin_session
    post  'admins/sign_in' => 'admins/sessions#create' ,  as: :admin_session
    delete 'admins/log_out' => 'admins/sessions#destroy' ,  as: :destroy_admin_session
  end
  namespace :admins do
    get '/top'=>'top#top'
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    patch 'admins/order_items/:id' => 'order_items#update'
  end
end
