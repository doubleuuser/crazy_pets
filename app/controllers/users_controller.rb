class UsersController < ApplicationController
  before_action :set_user
  def my_pets
    @my_pets = @user.pets
  end

  def my_bookings
    @my_bookings = @user.bookings
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
