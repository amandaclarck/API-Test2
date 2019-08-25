class ProductService
    def get_products
      @p = PrincipiaService.new.get_products
    end
end