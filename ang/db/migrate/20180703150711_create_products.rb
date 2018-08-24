class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :model
      t.text    :detail
      t.text    :short_specification
      t.text    :specification
      t.boolean :promo
      t.boolean :best_seller
      t.integer :brand_id
      t.integer :category_id
      t.string  :permalink
      t.timestamps
    end
  end
end
