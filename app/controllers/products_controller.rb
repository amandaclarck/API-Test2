class ProductsController < ApplicationController
    def index
      @products = ProductService.new.get_products
      render json: { data: @products }, status: :ok
    end
end
