class Admin::BrandsController < Admin::ApplicationController
  before_action :find_brand, :only => [:edit, :update, :destroy, :delete]

  def index
    @brands = Brand.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @brand = Brand.new
  end

  def create
    @new_brand = Brand.new(brand_params)
    unless params[:id].blank?
      find_brand
      @new_brand.parent_id = @brand.id
    end

    if @new_brand.save
      flash[:notice] = 'Brand was successfully create.'
      redirect_to admin_brands_path
    else
      flash[:error] = "Brand failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    puts "======"
    puts params.inspect
    if @brand.update_attributes(brand_params)
      flash[:notice] = 'Brand was successfully updated.'
      redirect_to admin_brands_path
    else
      puts @brand.errors.inspect
      puts "]]][[[[[]]"
      flash[:error] = "Brand failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @brand.destroy ? 'Brand was successfully deleted.' :
                                           'Brand was falied to delete.'
    redirect_to admin_brands_path
  end

  private

    def brand_params
      params.require(:brand).permit(:name, :logo, category_ids: [])
    end

    def find_brand
      @brand = Brand.find_by_id(params[:id])
      if @brand.nil?
        flash[:notice] = "Cannot find the Brand with id '#{params[:id]}'"
        redirect_to admin_brands_path
      end
    end
end
