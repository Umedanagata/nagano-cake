Rails.application.routes.draw do
  root 'items#top'
  get 'orders/confirm' => 'orders#confirm'
  resources :items
  resource :cart_items, only:[:index]
  devise_for :admins
  get 'addresses/index'
  get 'addresses/create'
  get 'addresses/edit'
  get 'addresses/update'
  get 'addresses/destroy'
  get 'customers/confirm'
  get 'customers/show'
  get 'customers/edit'
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
