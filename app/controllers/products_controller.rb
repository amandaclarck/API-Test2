class ProductsController < ApplicationController
  def index
    @products = ProductService.new.get_products
    render json: { data: @products }, status: :ok
  end
=begin
  def update
    #@products = ProductService.new.get_products.to_a
    @product = ProductService.find_by_seller_sku(params[:product])
    if @product.update(product_params)
      render json: { data: @product, message: 'Produto atualizado!' }, status: :created
    else
      render json: { status: 422, message: 'Produto não atualizado', data: @product.errors },
      status: :unprocessable_entity
    end
     
    #render json: { data:  Product.where(seller_sku: 1)}
    #@product = Product.where(p['id'])
    #render json: { data: @products[0][1][0]["name"]}
    #render json: { data: @products[0][1][0]["id"] }

  end
=end
  def update
    @products = ProductService.new.get_products

    @products["data"].each do |p|
      p["children"].each do |c|
        @product = Product.where(seller_sku: p["seller_sku"])
      
        if @product.update(old_quantity: c[:quantity], current_quantity: c[:quantity])
          render json: { data: @product, message: 'Produto atualizado!' }, status: :ok
        else
          render json: { status: 422, message: 'Produto não atualizado', data: @product.errors }, status: :unprocessable_entity
        end
      end
    end
  end

  def product_id
    @product = Product.find(params[:id])
  end

  def find_by_seller_sku
    @product = ProductService.new.find_by_seller_sku(params[:seller_sku])
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
