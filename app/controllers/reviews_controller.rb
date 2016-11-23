class ReviewsController < ApplicationController
  load_resource :tour
  load_resource :review, through: :tour

  def show
  end

  rescue_from ActiveRecord::RecordNotFound do
    if @tour.nil?
      flash[:danger] = t "flash.tours.tour_not_found"
      redirect_to root_path
    else
      flash[:danger] = t "flash.reviews.review_not_found"
      redirect_to @tour
    end
  end
end
