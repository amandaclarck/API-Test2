Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'products', action: :index, to: 'products#index'
  get 'product/stock_from_seller_sku', action: :stock_from_seller_sku, to: 'products#stock_from_seller_sku'
  get 'product/seller_sku', action: :seller_sku, to: 'products#seller_sku'
  put 'product/update_product_stock', action: :update_product_stock, to: 'products#update_product_stock'
end
