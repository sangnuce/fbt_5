class ToursController < ApplicationController
  load_resource

  def show
    @supports = Supports::TourSupport.new tour: @tour, page: params[:page]
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = t "flash.find_tour_fail"
    redirect_to root_path
  end
end
