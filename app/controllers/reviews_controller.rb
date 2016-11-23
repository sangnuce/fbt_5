class ReviewsController < ApplicationController
  load_resource :tour
  load_and_authorize_resource :review, through: :tour, param_method: :review_params

  before_action :authenticate_user!, only: [:new, :create]
  before_action :load_review_types, only: [:new, :create]

  def create
    @review.user = current_user
    if @review.save
      flash[:success] = t "flash.reviews.create_review_success"
      redirect_to @tour
    else
      render :new
    end
  end

  def show
    @comments = @review.comments.order_desc.paginate page: params[:page],
      per_page: Settings.reviews.comment_per_page
    @comment = @review.comments.build
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

  private
  def review_params
    params.require(:review).permit :review_type, :title, :content
  end

  def load_review_types
    @review_types = Review.review_types.map {|key, value| [key, key]}
  end
end
