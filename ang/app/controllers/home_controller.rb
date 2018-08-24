class HomeController < ApplicationController

  def index
    @banners = Banner.all.order("`order`, id")
    @best_seller_products = Product.best_sellers.limit(8)
    @promo_products = Product.promos.limit(8)
    @popular_brands = Brand.popular.limit(6)
  end
end
