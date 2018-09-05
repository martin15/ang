class CreateTestimonies < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonies do |t|
      t.string  :name
      t.string  :company
      t.text    :content
      t.timestamps
    end
  end
end
