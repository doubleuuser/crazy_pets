class BookingsController < ApplicationController
  before_action :set_pet, only: [:create]
  before_action :set_booking, only: [:edit, :update]

  def index
    @bookings = Booking.all
  end

  def new
  end

  def show
    set_booking
  end

  def list
   @my_pets = Pet.where(@pet.user == current_user)
  end


  def create
    @booking = Booking.new(user: current_user, pet: @pet)
    # how to get the associations?
    @booking.save
    redirect_to my_bookings_path(@booking.user)
  end

  def my_bookings
    @my_bookings = current_user.bookings
  end

  def edit
    @booking.user = current_user
    @booking.pet = @pet
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
