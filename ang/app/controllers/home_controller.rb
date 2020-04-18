class HomeController < ApplicationController

  def index
    @banners = Banner.all.order("`order`, id")
    @best_seller_products = Product.best_sellers.limit(8)
    @promo_products = Product.promos.limit(8)
    @popular_brands = Brand.all
    all_brand_name = @popular_brands.map(&:name).join(" - ")
    @meta_description_custom = " - #{all_brand_name}"
  end
end
