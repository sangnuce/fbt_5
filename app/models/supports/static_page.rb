class Supports::StaticPage
  def initialize
    @newest_tours = Tour.available.order_time_desc
      .limit Settings.tours.newest_tours
    @hotest_tours = Tour.available.order_bookings_desc
      .limit Settings.tours.hotest_tours
    @cheapest_tours = Tour.available.order(:price_per_person).limit Settings
      .tours.cheapest_tours
    @popular_places = Place.popular_desc.limit Settings.tours.popular_places
  end

  methods = %w(newest_tours hotest_tours cheapest_tours popular_places)
  methods.each do |method|
    define_method(method) {instance_variable_get "@#{method}"}
  end
end
