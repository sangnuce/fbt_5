class Admin::CategoriesController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.search(search_params).result.hash_tree
  end

  private
  def search_params
    params.permit :name_cont
  end
end
