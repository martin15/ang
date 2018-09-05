class Admin::TestimoniesController < Admin::ApplicationController
  before_action :find_testimony, :only => [:edit, :update, :destroy, :delete]

  def index
    @testimonies = Testimony.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @testimony = Testimony.new
  end

  def create
    @testimony = Testimony.new(testimony_params)

    if @testimony.save
      flash[:notice] = 'Testimony was successfully create.'
      redirect_to admin_testimonies_path
    else
      flash[:error] = "Testimony failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @testimony.update_attributes(testimony_params)
      flash[:notice] = 'Testimony was successfully updated.'
      redirect_to admin_testimonies_path
    else
      flash[:error] = "Testimony failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @testimony.destroy ? 'Testimony was successfully deleted.' :
                                           'Testimony was falied to delete.'
    redirect_to admin_testimonies_path
  end

  private

    def testimony_params
      params.require(:testimony).permit(:name, :company, :content)
    end

    def find_testimony
      @testimony = Testimony.find_by_id(params[:id])
      if @testimony.nil?
        flash[:notice] = "Cannot find the Testimony with id '#{params[:id]}'"
        redirect_to admin_testimonies_path
      end
    end
end
