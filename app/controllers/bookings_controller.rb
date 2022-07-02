class BookingsController < ApplicationController
  before_action :set_pet, only: [:create]
  def index
    @bookings = Booking.all #add user?
  end

  def new
  end

  def show
    set_booking
  end

  def list
    Pet.where()
  end


  def create
    @booking = Booking.new(user: current_user, pet: @pet)
    # how to get the associations?
    @booking.save
    redirect_to my_bookings_path(@booking.user)
  end

  private


  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
