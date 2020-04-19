Rails.application.routes.draw do


  #顧客側
  devise_for :customers
  root 'items#top'
  post 'orders/confirm' => 'orders#confirm', as: "orders_confirm"
  get 'orders/complete' => 'orders#complete', as: "orders_complete"
  resources :items, only: [:index, :show]
  delete 'cart_items' => 'cart_items#destroy_item', as: "destroy_item"
  resources :cart_items, only:[:index, :create, :destroy, :update]
  resources :orders, only:[:index, :show, :new, :create]
  resources :customers, only:[:show, :edit, :create, :update]
  get 'customers/confirm' => 'customers#confirm'
  resources :addresses, only:[:index, :create, :edit, :update, :destroy]

  #管理側
  namespace :admins do
    get '/top'=>'top#top'
    devise_for :customers
    resources :items
    resources :genres, only:[:index, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    patch 'admins/order_items/:id' => 'order_items#update'
  end
  devise_for :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
