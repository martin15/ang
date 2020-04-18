class StoreLocationController < ApplicationController
  def index
    @store_locations = StoreLocation.all
    all_store_name = @store_locations.map(&:name).join(" - ")
    @meta_description_custom = " - lokasi toko - #{all_store_name}"
  end
end
