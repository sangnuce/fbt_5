class CommentsController < ApplicationController
  load_resource :tour
  load_resource :review
  load_and_authorize_resource :comment, through: :review,
    param_method: :comment_params

  def create
    @comment.user = current_user
    if @comment.save
      @supports = Supports::ReviewSupport.new review: @review,
        page: params[:page], user: current_user

      respond_to do |format|
        format.html do
          flash[:success] = t "flash.comment_success"
          redirect_to tour_review_path(@tour, @review)
        end
        format.js
      end
    else
      flash[:danger] = t "flash.cant_add_comment"
      redirect_to tour_review_path(@tour, @review)
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content
  end
end
