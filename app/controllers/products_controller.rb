class ProductsController < ApplicationController
    def index
      @products = ProductService.new.get_products
      render json: { data: @products }, status: :ok
    end

    def stock_from_seller_sku
      @seller_sku = ProductStockService.new.get_stock_from_seller_sku
      render json: { data: @seller_sku }, status: :ok
    end

    def seller_sku
      @seller_sku = ProductStockService.new.get_seller_sku
      render json: { data: @seller_sku }, status: :ok
    end

    def update_product_stock
      update = ProductStockService.new.update_product_stock
      render json: { data: update }, status: :ok

    end
end
