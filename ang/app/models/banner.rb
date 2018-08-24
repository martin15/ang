class Banner < ApplicationRecord
  mount_uploader :image, BannerUploader

  validates_presence_of :image
  # validates :url, url: true
end
