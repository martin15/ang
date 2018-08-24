class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  BRAND_NAME = 'Aneka Niaga Global'.freeze
  before_action :load_categories

  def paging(per_page)
    start_number = params[:page].nil? ? 0*per_page : (params[:page].to_i-1)*per_page
    return start_number
  end


  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  private

    def load_categories
      @categories = Category.all.includes([:brands])
    end
end
