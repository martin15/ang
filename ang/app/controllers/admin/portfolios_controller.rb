class Admin::PortfoliosController < Admin::ApplicationController
  before_action :find_portfolio, :only => [:edit, :update, :destroy, :delete]

  def index
    @portfolios = Portfolio.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @portfolio = Portfolio.new
    @portfolio.portfolio_images.build
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      flash[:notice] = 'Portfolio was successfully create.'
      redirect_to admin_portfolios_path
    else
      @portfolio.portfolio_images = []
      @portfolio.portfolio_images.build 
      flash[:error] = "Portfolio failed to create"
      render :action => :new
    end
  end

  def edit
    if @portfolio.portfolio_images.blank?
      @portfolio.portfolio_images.build
    end
  end

  def update
    if @portfolio.update_attributes(portfolio_params)
      flash[:notice] = 'Portfolio was successfully updated.'
      redirect_to admin_portfolios_path
    else
      if @portfolio.portfolio_images.blank?
        @portfolio.portfolio_images.build
      end
      flash[:error] = "Portfolio failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @portfolio.destroy ? 'Portfolio was successfully deleted.' :
                                           'Portfolio was falied to delete.'
    redirect_to admin_portfolios_path(@brand.id)
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title, :short_description, :description,
                                        portfolio_images_attributes: [:id, :image, :_destroy])
    end

    def find_portfolio
      @portfolio = Portfolio.find_by_id(params[:id])
      if @portfolio.nil?
        flash[:notice] = "Cannot find the Portfolio with id '#{params[:id]}'"
        redirect_to admin_portfolios_path
      end
    end
end
