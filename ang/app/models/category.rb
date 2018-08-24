class Category < ApplicationRecord
  has_permalink :name, :update => true

  has_many :brands_categories, dependent: :destroy
  has_many :brands, through: :brands_categories
  has_many :products, dependent: :destroy

  validates :name, presence: true 

  scope :get_promo, -> { where("LOWER(name) = 'promo'") }
end
