class PrincipiaService
    attr_accessor :token, :seller_sku, :stock_name, :url_erp, :ecommerce_token, :url_ecommerce

    def initialize
        @token                = 'UXdy+MhMhvgUly7v0nVonA==' #erp
        @stock_name           = 'CD'
        @url_erp              = 'https://private-anon-c0c746b3d9-principiagenericapiintegration.apiary-mock.com/v1/'
        @ecommerce_token      = 'et9OmPl2QaRTbBMChkzraA=='
        @url_ecommerce        = 'http://store.api.achieveleap.com/skus/'
    end

    def headers
      {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization: ': @token
      }
    end

    def get_products
      products = RestClient.get(@url_erp + '/products', headers= {A1_TOKEN: 'UXdy+MhMhvgUly7v0nVonA=='})
      products_array = JSON.parse(products)
    end

    def seller_sku
      products = get_products
      seller_sku = products["data"][0]["children"][0]["seller_sku"]
    end

    def last_update_of_stock_from_seller_sku
      @seller_sku = seller_sku
      product = RestClient.get(@url_erp + '/products/partial_attributes/' + @seller_sku, headers= {A1_TOKEN: 'UXdy+MhMhvgUly7v0nVonA=='})
      product = JSON.parse(product)
      #product["data"]["stock"]
    end

    def update_product_stock
      @seller_sku = seller_sku
      #RestClient.put(@url_ecommerce.concat(@seller_sku), headers=headers,
      #stock_name = @stock_name)
      #headers
    end
end 