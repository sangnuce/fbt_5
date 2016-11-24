class BookingsController < ApplicationController
  before_action :authenticate_user!

  load_resource :tour
  load_and_authorize_resource :booking, through: :tour

  before_action :load_tour_dates, only: :new

  def new
  end

  def create
    @booking.user = current_user
    @booking.status = Booking.statuses[:waiting_pay]
    if @booking.save
      @payment = Payment.new
      render "payments/new"
    else
      load_tour_dates
      flash[:danger] = t "flash.bookings.create_booking_fail"
      render :new
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = t "flash.tours.tour_not_found"
    redirect_to root_path
  end

  private
  def booking_params
    params.require(:booking).permit :user_id, :tour_date_id,
      :num_tourist, :contact_name, :contact_phone, :contact_address,
      :description, :total_price, :status
  end

  def load_tour_dates
    @dates ||= @tour.tour_dates.collect{|date| [date.start_date, date.id]}
  end
end
