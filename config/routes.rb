Rails.application.routes.draw do


  #顧客側
  root 'items#top'
  get 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :items, only: [:index, :show]
  resources :cart_items, only:[:index, :create, :destroy, :update]
  delete '/cart_items/:id' => 'cart_items#destroy_item'
  resources :orders, only:[:index, :show, :new, :create]
  resources :customers, only:[:show, :edit, :create, :update]
  get 'customers/confirm' => 'customers#confirm'
  resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  devise_for :customers
  


  #管理側
  namespace :admins do
    get '/top'=>'top#top'
    devise_for :customers
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    patch 'admins/order_items/:id' => 'order_items#update'
  end
  devise_for :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
