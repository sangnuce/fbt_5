class Admin::ToursController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @statuses = Tour.statuses.map {|key, value|
      [t("admin.tours.statuses.#{key}"), value]}
    @tours = Tour.search(search_params).result.paginate page: params[:page],
      per_page: Settings.tours.tours_per_page
  end

  def destroy
    if @tour.destroy
      flash[:success] = t "flash.tours.delete_tour_success"
      redirect_to admin_tours_path
    else
      flash[:danger] = t "flash.tours.delete_tour_fail"
      redirect_to admin_tour_path @tour
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = t "flash.find_tour_fail"
    redirect_to admin_tours_path
  end

  private
  def search_params
    params.permit :name_or_category_name_or_places_name_cont,
      :status_eq
  end
end
