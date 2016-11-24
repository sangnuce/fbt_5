class LikesController < ApplicationController
  load_resource :tour
  load_resource :review, through: :tour
  load_and_authorize_resource :like, through: :review

  before_action :authenticate_user!
  before_action :load_support

  def create
    @like.user = current_user
    if @like.save
      load_support
      flash[:success] = t "flash.likes.like_success"
    else
      flash[:success] = t "flash.likes.like_fail"
    end

    respond_to do |format|
      format.html do
        redirect_to tour_review_path(@tour, @review)
      end
      format.js
    end
  end

  def destroy
    if @like.destroy
      load_support
      flash[:success] = t "flash.likes.unlike_success"
    else
      flash[:success] = t "flash.likes.unlike_fail"
    end

    respond_to do |format|
      format.html do
        redirect_to tour_review_path(@tour, @review)
      end
      format.js
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    redirect_destination = root_path
    if @tour.nil?
      flash[:danger] = t "flash.tours.tour_not_found"
    elsif @review.nil?
      flash[:danger] = t "flash.reviews.review_not_found"
      redirect_destination = @tour
    else
      flash[:danger] = t "flash.likes.like_not_found"
      redirect_destination = tour_review_path(@tour, @review)
    end

    respond_to do |format|
      format.html do
        redirect_to redirect_destination
      end
      format.js
    end
  end

  private
  def load_support
    @supports = Supports::ReviewSupport.new review: @review,
      page: params[:page], user: current_user
  end
end
