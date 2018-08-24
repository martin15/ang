class Admin::StoreLocationsController < Admin::ApplicationController
  before_action :find_store_location, :only => [:edit, :update, :destroy, :delete]

  def index
    @store_locations = StoreLocation.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @store_location = StoreLocation.new
  end

  def create
    @new_store_location = StoreLocation.new(store_location_params)
    unless params[:id].blank?
      find_store_location
      @new_store_location.parent_id = @store_location.id
    end

    if @new_store_location.save
      flash[:notice] = 'StoreLocation was successfully create.'
      redirect_to admin_store_locations_path
    else
      flash[:error] = "StoreLocation failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @store_location.update_attributes(store_location_params)
      flash[:notice] = 'StoreLocation was successfully updated.'
      redirect_to admin_store_locations_path
    else
      flash[:error] = "StoreLocation failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @store_location.destroy ? 'StoreLocation was successfully deleted.' :
                                           'StoreLocation was falied to delete.'
    redirect_to admin_store_locations_path
  end

  private

    def store_location_params
      params.require(:store_location).permit(:name, :detail)
    end

    def find_store_location
      @store_location = StoreLocation.find_by_id(params[:id])
      if @store_location.nil?
        flash[:notice] = "Cannot find the StoreLocation with id '#{params[:id]}'"
        redirect_to admin_store_locations_path
      end
    end
end
