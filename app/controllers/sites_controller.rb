class SitesController < ApplicationController
  def index
    @sites = Site.order(:rank)
  end
end
