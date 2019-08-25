class PrincipiaService
    attr_accessor :token, :seller_sku, :stock_name, :url, :ecommerce_token

    def initialize
        @token                = 'UXdy+MhMhvgUly7v0nVonA==' #erp
        @seller_sku           = ''
        @stock_name           = 'CD'
        @url                  = 'https://private-anon-c0c746b3d9-principiagenericapiintegration.apiary-mock.com/v1/'
        @ecommerce_token      = 'et9OmPl2QaRTbBMChkzraA=='
    end

    def headers
      {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'A1_TOKEN': @token
      }
    end

    def get_products
        RestClient.get(@url + '/products', headers= {A1_TOKEN: 'UXdy+MhMhvgUly7v0nVonA=='})
    end
end