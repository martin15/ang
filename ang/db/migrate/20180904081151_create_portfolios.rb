class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string    :title
      t.string    :short_description
      t.text      :description
      t.string    :permalink
      t.timestamps
    end
  end
end
