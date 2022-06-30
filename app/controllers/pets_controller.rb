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
    @pet.user = current_user
    puts current_user
    puts "#{@pet.name} is my pet and i am #{@pet.user_id}"
    @pet.save
    redirect_to pets_path(@pet)
  end

  def pet_params
    params.require(:pet).permit(:name, :description, :price, :species, :image_url)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

end
