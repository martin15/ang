class Admin::ServiceCentersController < Admin::ApplicationController
  before_action :find_brand
  before_action :find_service_center, :only => [:edit, :update, :destroy, :delete]

  def index
    @service_centers = @brand.service_centers
    @service_center = ServiceCenter.new
  end

  def new
    @service_center = ServiceCenter.new
  end

  def create
    @service_center = ServiceCenter.new(service_center_params)
    @service_center.brand = @brand

    if @service_center.save
      flash[:notice] = 'ServiceCenter was successfully create.'
      redirect_to admin_service_centers_path(@brand.id)
    else
      flash[:error] = "ServiceCenter failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @service_center.update_attributes(service_center_params)
      flash[:notice] = 'ServiceCenter was successfully updated.'
      redirect_to admin_service_centers_path(@brand.id)
    else
      flash[:error] = "ServiceCenter failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @service_center.destroy ? 'ServiceCenter was successfully deleted.' :
                                                'ServiceCenter was falied to delete.'
    redirect_to admin_service_centers_path(@brand.id)
  end

  private

    def service_center_params
      params.require(:service_center).permit(:name, :detail, :brand_id)
    end

    def find_brand
      @brand = Brand.find_by_id(params[:id])
      if @brand.nil?
        flash[:notice] = "Cannot find the Brand with id '#{params[:id]}'"
        redirect_to admin_brands_path
      end
    end

    def find_service_center
      @service_centers = @brand.service_centers
      @service_center = @service_centers.find_by_id(params[:service_center_id])
      if @service_center.nil?
        flash[:notice] = "Cannot find the ServiceCenter with id '#{params[:service_center_id]}' for Brand '#{@brand.name}'"
        redirect_to admin_service_centers_path(@brand.id)
      end
    end
end
