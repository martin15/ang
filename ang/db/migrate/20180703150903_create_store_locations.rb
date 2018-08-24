class CreateStoreLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :store_locations do |t|
      t.string  :name
      t.text    :detail
      t.timestamps
    end
  end
end
