class Supports::TourSupport
  def initialize params
    @tour = params[:tour]
    @page = params[:page]
  end

  def user_rated? user
    @tour.rates(:quality).find_by(rater: user).present?
  end

  def reviews
    @reviews = @tour.reviews.order_time_desc.paginate page: @page,
      per_page: Settings.reviews.per_pages_review
  end

  def tour_dates
    @dates ||= @tour.tour_dates.collect{|date| [date.start_date, date.id]}
  end
end
