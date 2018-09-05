class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string  :banner
      t.string  :title
      t.text    :content
      t.text    :short_content
      t.boolean :default
      t.string  :permalink
      t.timestamps
    end
  end
end
