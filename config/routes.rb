Rails.application.routes.draw do

  namespace :admins do
    get '/top'=>'top#top'
    devise_for :customers
    resources :items
  end

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
