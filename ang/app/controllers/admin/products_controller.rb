class Admin::ProductsController < Admin::ApplicationController
  before_action :find_product, :only => [:edit, :update, :destroy, :delete]

  def index
    if !params[:brand].nil?
      @products = Product.joins(:brand).where("brands.permalink = '#{params[:brand]}'").
                          page(params[:page]).per(20)
    elsif !params[:category].nil?
      @products = Product.joins(:category).where("categories.permalink = '#{params[:category]}'").
                          page(params[:page]).per(20)
    else
      @products = Product.all.page(params[:page]).per(20)
    end
    @products = @products.includes([:brand, :category])
    @no = paging(20)
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product was successfully create.'
      redirect_to admin_products_path
    else
      @product.product_images = []
      @product.product_images.build 
      flash[:error] = "Product failed to create"
      render :action => :new
    end
  end

  def edit
    if @product.product_images.blank?
      @product.product_images.build
    end
  end

  def update
    if @product.update_attributes(product_params)
      flash[:notice] = 'Product was successfully updated.'
      redirect_to admin_products_path
    else
      if @product.product_images.blank?
        @product.product_images.build
      end
      flash[:error] = "Product failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @product.destroy ? 'Product was successfully deleted.' :
                                                'Product was falied to delete.'
    redirect_to admin_products_path(@brand.id)
  end

  def reload_brand
    category = Category.find_by_id(params[:cat_id])
    puts category.inspect
    unless category.nil?
      @brands = category.brands
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :model, :detail, :short_specification, :specification, 
        :promo, :best_seller , :brand_id, :category_id, product_images_attributes: [:id, :image, :_destroy])
    end

    def find_product
      @product = Product.find_by_id(params[:id])
      if @product.nil?
        flash[:notice] = "Cannot find the Product with id '#{params[:id]}'"
        redirect_to admin_products_path
      end
    end
end
