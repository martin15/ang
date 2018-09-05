class News < ApplicationRecord
  mount_uploader :banner, NewsBannerUploader

  has_permalink :title, :update => true

  before_save :remove_other_default_news

  def self.latest_news
    News.order("updated_at DESC").limit(4)
  end

  def default?
    !!self.default
  end

  def remove_other_default_news
    if self.default == true
      News.update_all(default: false)
    end
  end
end
