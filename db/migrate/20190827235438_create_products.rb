class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :old_quantity
      t.integer :current_quantity
      t.integer :seller_sku

      t.timestamps
    end
  end
end
