class Portfolio < ApplicationRecord
  has_permalink :title, :update => true

  validates :title, presence: true

  has_many :portfolio_images, inverse_of: :portfolio

  accepts_nested_attributes_for :portfolio_images, allow_destroy: true

  def image(size)
    img = self.portfolio_images.first
    if img.nil?
      return "/assets/no-image-yet.jpg"
    else
      return img.image.url(size.to_sym)
    end
  end
end
