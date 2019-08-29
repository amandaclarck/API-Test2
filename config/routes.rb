Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'products', action: :index, to: 'products#index'
  post 'products/update', action: :update, to: 'products#update'
  get 'products/find_by_seller_sku/', action: :find_by_seller_sku, to: 'products#find_by_seller_sku'
  put 'products/update_product_stock', action: :update_product_stock, to: 'products#update_product_stock'
end
