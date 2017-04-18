Rails.application.routes.draw do
  resources :products
  root 'store#index' , as: 'store_index'
end
