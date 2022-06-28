class BookingsController < ApplicationController
  def index
    @bookings = Booking.all #add user?
  end

  def new
    @booking = Booking.new
  end

  def show
    set_booking
  end

  def create
    @booking = Booking.new(booking_params)
    # how to get the associations?
    @booking.save
    redirect_to bookings_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :pet, :user)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
