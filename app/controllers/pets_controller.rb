class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def show
  end

  def edit
    @pet.user = current_user
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def create
    @pet = Pet.new(pet_params)
    # how to get the associations?
    @pet.user = current_user
    puts current_user
    puts "#{@pet.name} is my pet and i am #{@pet.user_id}"
    @pet.save
    redirect_to pets_path(@pet)
  end

  def my_pets
    @my_pets = current_user.pets
  end

  def destroy
    @pet.destroy
    redirect_to my_pets_path(current_user)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :price, :species, :image_url)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

end
