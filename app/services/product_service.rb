class ProductService
  attr_accessor :token, :seller_sku, :stock_name, :url_erp, :ecommerce_token, :url_ecommerce

  def initialize
      @token                = 'UXdy+MhMhvgUly7v0nVonA==' #erp
      @stock_name           = 'CD'
      @url_erp              = 'https://api-platforms.e-principia.com.br/v1/'
      @ecommerce_token      = 'et9OmPl2QaRTbBMChkzraA=='
      @url_ecommerce        = 'http://store.api.achieveleap.com/skus/'
  end

  def get_products
    products = RestClient.get(@url_erp + '/products', headers= {A1_TOKEN: 'UXdy+MhMhvgUly7v0nVonA=='})
    products_array = JSON.parse(products)
  end

  def find_by_seller_sku(seller_sku)
    product = RestClient.get(@url_erp + '/products/' + seller_sku, headers= {A1_TOKEN: 'UXdy+MhMhvgUly7v0nVonA=='})
    product = JSON.parse(product)
  end

  def update_by_seller_sku
    @products = get_products
    message = []
    @products["data"].each do |p|
      p["children"].each do |c|
        @products = Product.where(seller_sku: c["seller_sku"])
        @products.each do |product|
          @product = product
          if @product.update(old_quantity: @product.current_quantity, current_quantity: c["quantity"])
            message << "Produto atualizado! seller_sku: " + @product.seller_sku.to_s
          else
            message << @product.errors.add(:id, message: "Produto não atualizado. seller_sku: " + @product.seller_sku.to_s) 
          end
        end
      end
    end
    message
  end
end