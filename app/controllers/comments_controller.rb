class CommentsController < ApplicationController
  load_resource :tour
  load_resource :review, through: :tour
  load_and_authorize_resource :comment, through: :review,
    param_method: :comment_params

  before_action :load_supports

  def show
    respond_to do |format|
      format.js
    end
  end

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    parent = Comment.new
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by id: params[:comment].delete(:parent_id)
      @comment = parent.children.build comment_params
      @comment.review = parent.review
    end
    @comment.user = current_user
    if @comment.save
      if parent.user.present? && !parent.user.current_user?(current_user)
        current_user.active_notifications.create notified: parent.user,
          notifiable: @comment, target: parent
      end
      unless @comment.review.user.current_user? current_user
        current_user.active_notifications.create notified: @comment.review.user,
          notifiable: @comment, target: @comment.review
      end
      load_supports
      respond_to do |format|
        format.html do
          flash[:success] = t "flash.comments.comment_success"
          redirect_to tour_review_path(@tour, @review)
        end
        format.js
      end
    else
      flash[:danger] = t "flash.comments.cant_add_comment"
      redirect_to tour_review_path(@tour, @review)
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content
  end

  def load_supports
    @supports = Supports::ReviewSupport.new review: @review,
      page: params[:page], user: current_user, parent_id: params[:parent_id]
  end
end
