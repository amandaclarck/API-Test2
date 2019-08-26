class ProductStockService
    def get_stock_from_seller_sku
      @stock = PrincipiaService.new.last_update_of_stock_from_seller_sku
    end

    def get_seller_sku
      @seller_sku = PrincipiaService.new.seller_sku
    end

    def update_product_stock
      PrincipiaService.new.update_product_stock
    end
end