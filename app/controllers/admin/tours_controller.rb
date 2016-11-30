class Admin::ToursController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @statuses = Tour.statuses.map {|key, value|
      [t("admin.tours.statuses.#{key}"), value]}
    @tours = Tour.search(search_params).result.paginate page: params[:page],
      per_page: Settings.tours.tours_per_page
  end

  private
  def search_params
    params.permit :name_or_category_name_or_places_name_cont,
      :status_eq
  end
end
