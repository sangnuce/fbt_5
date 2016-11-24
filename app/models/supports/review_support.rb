class Supports::ReviewSupport
  def initialize params
    @review = params[:review]
    @page = params[:page]
    @user = params[:user]
    @like = @review.likes.find_by(user: @user) || @review.likes.build
  end

  def user_rated? user
    @review.rates(:quality).find_by(rater: user).present?
  end

  def comments
    @comments = @review.comments.order_desc.paginate page: @page,
      per_page: Settings.reviews.comment_per_page
  end

  def comment
    @comment = @review.comments.build
  end

  def like
    @like
  end

  def like_title
    if @like.new_record?
      I18n.t "likes.like.like_review"
    else
      I18n.t "likes.like.unlike_review"
    end
  end
end
