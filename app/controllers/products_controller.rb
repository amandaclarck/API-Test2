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
    render json: { data: @products }
  end

  private
  def product_params
    params.require(:product).permit(:seller_sku, :old_quantity, :current_quantity)
  end

  def product_current_quantity
    params.require(:product).permit(:seller_sku, :current_quantity)
  end

  def product_old_quantity
    params.require(:product).permit(:seller_sku, :old_quantity)
  end
end
