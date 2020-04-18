class ServiceCenterController < ApplicationController
  def index
    @brands = Brand.all.order('name')
    @meta_description_custom = " - service center"
  end
end
