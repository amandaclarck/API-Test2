class ProductService
    def get_products
      @products = PrincipiaService.new.get_products
    end
end