class CreatePortfolioImages < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_images do |t|
      t.string  :image
      t.string  :portfolio_id
      t.timestamps
    end
  end
end
