class Admin::PortfolioImagesController < Admin::ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_portfolio, :only => [:new, :create, :edit, :update, :destroy]
  before_action :find_portfolio_image, :only => [:edit, :update, :destroy]

  def new
    respond_to do |format|
      @portfolio_image = PortfolioImage.new
      format.js
    end
  end

  def create
    @portfolio_image = PortfolioImage.new(portfolio_image_params)
    @portfolio_image.portfolio = @portfolio
    if @portfolio_image.save
      flash[:notice] = 'PortfolioImage was successfully create.'
    else
      flash[:error] = "PortfolioImage failed to create"
    end
    redirect_to edit_admin_portfolio_path(@portfolio.id)
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @failed_portfolio_image = 0
    if @portfolio_image.update_attributes(portfolio_image_params)
      flash[:notice] = 'PortfolioImage was successfully updated.'
      redirect_to edit_admin_portfolio_path(@portfolio.id)
    else
      flash[:error] = "PortfolioImage failed to update"
      @failed_portfolio_image = @portfolio_image.id
      redirect_to edit_admin_portfolio_path(@portfolio.id, failed_portfolio_image: @portfolio_image.id)
    end
  end

  def destroy
    flash[:notice] =  @portfolio_image.destroy ? 'PortfolioImage was successfully deleted.' :
                                                'PortfolioImage was falied to delete.'
    redirect_to edit_admin_portfolio_path(@portfolio.id)
  end

  private

    def portfolio_image_params
      params[:portfolio_image] = {image: ""} if params[:portfolio_image].blank?
      params.require(:portfolio_image).permit(:image)
    end

    def find_portfolio_image
      @portfolio_image = PortfolioImage.find_by_id(params[:portfolio_image_id])
      if @portfolio_image.nil?
        flash[:notice] = "Cannot find the PortfolioImage with id '#{params[:portfolio_image_id]}'"
        redirect_to admin_portfolios_path
      end
    end

    def find_portfolio
      @portfolio = Portfolio.find_by_id(params[:id])
      if @portfolio.nil?
        flash[:notice] = "Cannot find the Portfolio with id '#{params[:id]}'"
        redirect_to admin_portfolios_path
      end
    end
end
