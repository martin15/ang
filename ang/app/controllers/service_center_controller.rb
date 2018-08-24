class ServiceCenterController < ApplicationController
  def index
    @brands = Brand.all.order('name')
  end
end
