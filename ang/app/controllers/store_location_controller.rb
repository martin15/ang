class StoreLocationController < ApplicationController
  def index
    @store_locations = StoreLocation.all
  end
end
