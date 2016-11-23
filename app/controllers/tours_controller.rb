class ToursController < ApplicationController
  load_resource

  def show
    @reviews = @tour.reviews.order_time_desc.paginate page: params[:page],
      per_page: Settings.reviews.per_pages_review
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = t "flash.find_tour_fail"
    redirect_to root_path
  end
end
