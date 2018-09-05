class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all.order("updated_at DESC").page(params[:page]).per(12)
    @portfolios_arr = @portfolios.each_slice(3).to_a
  end

  def show
    @portfolio = Portfolio.find_by_permalink(params[:permalink])
    if @portfolio.nil?
      flash[:error] = "Cannot find the News !"
      redirect_to portfolios_path
    end
  end
end
