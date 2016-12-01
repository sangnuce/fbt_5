class RaterController < ApplicationController
  before_action :authenticate_user!

  def create
    obj = params[:klass].classify.constantize.find params[:id]
    obj.rate params[:score].to_f, current_user, params[:dimension]
    unless obj.class.name == "Tour" || obj.user.current_user?(current_user)
      rate = Rate.find_by rater: current_user, rateable: obj,
        dimension: params[:dimension]
      current_user.active_notifications.create notified: obj.user,
        notifiable: rate, target: obj
    end
    render json: true
  end
end
