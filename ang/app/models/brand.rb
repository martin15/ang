class Brand < ApplicationRecord
  has_permalink :name, :update => true

  mount_uploader :logo, BrandLogoUploader

  has_many :brands_categories, dependent: :destroy
  has_many :categories, through: :brands_categories
  has_many :products, dependent: :destroy
  has_many :service_centers, dependent: :destroy

  validates_presence_of :logo
  validates :name, presence: true 
  scope :popular, -> { where(popular: true) }

end
