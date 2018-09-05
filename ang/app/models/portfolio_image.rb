class PortfolioImage < ApplicationRecord
  belongs_to  :portfolio

  mount_uploader :image, PortfolioImageUploader

  validates :image, presence: true
end
