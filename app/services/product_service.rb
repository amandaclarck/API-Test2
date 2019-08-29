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
=begin
     def create
      products = get_products

      products.each do |p|
        @product = Product.where(p['id'])
        Product.(product)
      end
      #products
      #seller_sku = products["data"][0]["children"][0]["seller_sku"]
    end
=end
    def find_by_seller_sku(seller_sku)
      product = RestClient.get(@url_erp + '/products/' + seller_sku, headers= {A1_TOKEN: 'UXdy+MhMhvgUly7v0nVonA=='})
      product = JSON.parse(product)
    end

    # def update_by_seller_sku_
    #   @products = get_products
    #   #@product = Product.where(seller_sku: c["seller_sku"])
    #   @products["data"]["children"].each do |p|
    #     @product = Product.find(id: p["id"])
    #     if(@product.update())
    #     end
    #   end
    # end
end