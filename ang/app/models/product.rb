class Product < ApplicationRecord
  has_permalink :name, :update => true

  has_many :product_images, inverse_of: :product

  belongs_to  :brand
  belongs_to  :category

  validates :name, presence: true
  validates :detail, presence: true
  validates :short_specification, presence: true

  accepts_nested_attributes_for :product_images, allow_destroy: true

  scope :best_sellers, -> { where(best_seller: true) }
  scope :promos, -> { where(promo: true) }

  def is_promo?
    !!self.promo
  end

  def is_best_seller?
    !!self.best_seller
  end

  def image(size)
    img = self.product_images.first
    if img.nil?
      return "/assets/no-image-yet.jpg"
    else
      return img.image.url(size.to_sym)
    end
  end

end
