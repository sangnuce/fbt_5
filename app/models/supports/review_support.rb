class Supports::ReviewSupport
  def initialize params
    @review = params[:review]
    @page = params[:page]
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
end
