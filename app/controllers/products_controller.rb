class ProductsController < ApplicationController
  def index
    @products = ProductService.new.get_products
    render json: { data: @products }, status: :ok
  end

  def update_by_seller_sku
    message = ProductService.new.update_by_seller_sku
    render json: { data: message }, status: :ok #ver depois status
  end

  def find_by_seller_sku
    @product = ProductService.new.find_by_seller_sku(params[:seller_sku])
    render json: { data: @product }, status: :ok
  end

  def get_products_to_compare
    @products = ProductService.new.get_products_to_update
    render json: { data: @products }, status: :ok
  end

  def update_product_stock_ecommerce
    @products = ProductService.new.update_product_stock_ecommerce
    render json: { data: @products }, status: :ok
  end

  def update_local_db
    @products = ProductService.new.update_local_db
    render json: { data: @products }, status: :ok
  end
end
