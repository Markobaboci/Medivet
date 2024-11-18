class ClinicsController < ApplicationController
  before_action :set_user
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      @clinics = Clinic.search_by_address(params[:query])
    else
      @user_clinics = current_user.clinics if user_signed_in?
      @all_clinics = Clinic.all
    end
  end

  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @clinic = @user.clinics.find(params[:id])
    else
      @clinic = Clinic.find(params[:id])
      @user = @clinic.user
    end

    @marker = {
      lat: @clinic.latitude,
      lng: @clinic.longitude
    }
  end

  def new
    @clinic = @user.clinics.build
  end

  def create
    @clinic = @user.clinics.build(clinic_params)
    if @clinic.save
      redirect_to clinic_path(@clinic)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @user = @clinic.user
  end

  def update
    if @clinic.update(clinic_params)
      redirect_to clinic_path(@clinic), notice: 'Clinic updated successfully.'
    else
      Rails.logger.debug "Clinic update failed: #{@clinic.errors.full_messages.join(', ')}"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @clinic.destroy
    redirect_to clinics_path, status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:email, :phone_numer, :address, :description, :rate, :care_type, :webpage, :species,
    :image)
  end
end
