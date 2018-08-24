class ProductsController < ApplicationController

  def index
    @categories = Category.all.includes([:brands])
    @category = Category.find_by_permalink(params[:category_permalink])
    @brand = Brand.find_by_permalink(params[:brand_permalink])
    @products = Product.joins(:brand, :category).
                        where("brands.permalink = '#{params[:brand_permalink]}' and
                               categories.permalink = '#{params[:category_permalink]}'").
                        page(params[:page]).per(15)
  end

  def show
    @product = Product.joins(:brand, :category).
                       where("products.permalink = '#{params[:product_permalink]}' and 
                              brands.permalink = '#{params[:brand_permalink]}' and
                              categories.permalink = '#{params[:category_permalink]}'").first

    if @product.nil?
      category = Category.find_by_permalink(params[:category_permalink])
      category = Category.first if category.nil?
      brand = Brand.find_by_permalink(params[:brand_permalink])
      brand = Brand.first if brand.nil?
      flash[:error] = "Cannot Found the Product"
      redirect_to products_by_category_path(category.permalink, brand.permalink)
      return
    end
    @details = @product.detail.split(/\r\n/).reject { |c| c.blank? }
    @specifications = @product.specification.split(/\r\n/).reject { |c| c.blank? }
    @related_products = Product.joins(:brand, :category).
                                where("brands.permalink = '#{params[:brand_permalink]}' and
                                       categories.permalink = '#{params[:category_permalink]}'").
                                order("RAND()").limit(10)
  end

  def search
    @category = Category.find_by_permalink(params[:product])
    @brand = Brand.find_by_permalink(params[:brand])
    if @category.nil? && @brand.nil?
      redirect_to root_path
      return
    end

    if params[:product] == Category.get_promo.first.try(:permalink)
      @products = Product.promos
    else
      name = ""
      name = "( products.name = '#{params[:name]}' or products.model = '#{params[:name]}' or 
                products.permalink = '#{params[:name]}' ) and " unless params[:name].blank?
      @products = Product.joins(:brand, :category).
                          where(" #{name}
                                brands.permalink = '#{params[:brand]}' and
                                categories.permalink = '#{params[:product]}'")
    end

  end

  def reload_brand
    @category = Category.find_by_permalink(params[:product])
    puts @category.inspect
    unless @category.nil?
      @brands = @category.brands
    end
  end

end
