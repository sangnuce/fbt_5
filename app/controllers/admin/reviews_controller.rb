class Admin::ReviewsController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @reviews = Review.order_time_desc.paginate page: params[:page],
    per_page: Settings.reviews.admin_review_per_page
  end
end
