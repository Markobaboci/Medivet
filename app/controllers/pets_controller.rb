class PetsController < ApplicationController
  def index
    @pets = current_user.pets
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.build(pet_params) # This associates the pet with the logged-in user
    if @pet.save
      redirect_to @pet, notice: 'Pet was successfully created.'
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to @pet
    else
      render :edit
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path, notice: 'Pet was successfully deleted.'
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :age, :breed, :weight, :description)
  end
end
