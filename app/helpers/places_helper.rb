module PlacesHelper
  def places_tree_for places
    places.map do |place, nested_places|
      render(place) + (nested_places.size > 0 ? content_tag(:tr,
        places_tree_for(nested_places), class: "panel-collapse collapse",
        id: "place-#{place.place_type}") : nil)
    end.join.html_safe
  end
end
