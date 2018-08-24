class CreateServiceCenters < ActiveRecord::Migration[5.1]
  def change
    create_table :service_centers do |t|
      t.string  :name
      t.text    :detail
      t.integer :brand_id
      t.timestamps
    end
  end
end
