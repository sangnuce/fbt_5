class Admin::PlacesController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @supports = Supports::PlaceSupport.new place_type: params[:place_type]
    respond_to do |format|
      format.json {render json: @supports.parent_places}
    end
  end

  def new
    @supports = Supports::PlaceSupport.new place_type: params[:place_type]
  end

  def create
    @supports = Supports::PlaceSupport.new place_type: params[:place_type]
    if params[:parent_id].to_i > 0
      parent = Place.find_by id: params[:parent_id]
      @place = parent.children.build place_params
    end
    if @place.save
      flash[:success] = t "flash.places.add_place_success"
      redirect_to admin_places_path
    else
      render :new
    end
  end

  def edit
    @supports = Supports::PlaceSupport.new place_type: @place.place_type
  end

  def update
    @supports = Supports::PlaceSupport.new place_type: @place.place_type
    if @place.update_attributes place_params
      flash[:success] = t "flash.places.edit_place_success"
      redirect_to admin_places_path
    else
      render :edit
    end
  end

  private
  def place_params
    params.require(:place).permit :name, :picture, :place_type, :parent_id
  end
end
