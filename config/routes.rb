Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'api/products', action: :index, to: 'products#index'
  post 'api/products/update_by_seller_sku', action: :update_by_seller_sku, to: 'products#update_by_seller_sku'
  get 'api/products/find_by_seller_sku/', action: :find_by_seller_sku, to: 'products#find_by_seller_sku'
  get 'api/products/get_products_to_compare', action: :get_products_to_compare, to: 'products#get_products_to_compare'
  get 'api/products/update_product_stock_ecommerce', action: :update_product_stock_ecommerce, to: 'products#update_product_stock_ecommerce'
  get 'api/products/update_local_db', action: :update_local_db, to: 'products#update_local_db'
end
