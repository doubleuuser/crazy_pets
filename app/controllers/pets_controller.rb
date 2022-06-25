class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def show
    set_pet
  end

  def create
    @pet = Pet.new(pet_params)
    # how to get the associations?
    @pet.save
    redirect_to pets_path(@pet)
  end

  def pet_params
    params.require(:pet).permit(:name, :description, :price, :species)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

end
