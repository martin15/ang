class AboutUsController < ApplicationController
  def index
    @testimonies = Testimony.all
  end
end
