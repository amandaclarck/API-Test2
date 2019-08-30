class ProductService
  attr_accessor :token, :seller_sku, :stock_name, :url_erp, :ecommerce_token, :url_ecommerce

  def initialize
      @token                = 'UXdy+MhMhvgUly7v0nVonA==' #erp
      @stock_name           = 'CD'
      @url_erp              = 'https://api-platforms.e-principia.com.br/v1/'
      @ecommerce_token      = 'et9OmPl2QaRTbBMChkzraA=='
      @url_ecommerce        = 'http://store.api.achieveleap.com/api/v1/skus/'
  end

  def headers
    {
      key: "Authorization",
      value: "Token token=\"et9OmPl2QaRTbBMChkzraA==\"",
      content_type: "application/json"
    }

  end
 
  def get_products
    products = RestClient.get(@url_erp + '/products', headers= {A1_TOKEN: @token})
    products_array = JSON.parse(products)
  end

  def find_by_seller_sku(seller_sku)
    product = RestClient.get(@url_erp + '/products/' + seller_sku, headers= {A1_TOKEN: @token})
    product = JSON.parse(product)
  end

  def update_by_seller_sku(products_to_update)
    message = []
    products_to_update["data"].each do |p|
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

  def get_products_to_update
    @products_api = get_products
    products = []
    @products_api["data"].each do |p|
      p["children"].each do |c|
        @products = Product.where.not(current_quantity: p["quantity"]).where(seller_sku: c["seller_sku"])
        @products.each do |product|
          products << product
        end
      end
    end
    products
  end

  def update_product_stock_ecommerce
    products = get_products_to_update

    products.each do |product|
      body =  { product: { quantity: product["current_quantity"] } }
      url = @url_ecommerce + product["seller_sku"].to_s + "?stock_name=" + @stock_name

      response = RestClient.put url, body, {content_type: "application/json", authorization: "Token token=\"et9OmPl2QaRTbBMChkzraA==\""}
    end
  end

  def update_local_db
    update_by_seller_sku(get_products)
  end
end