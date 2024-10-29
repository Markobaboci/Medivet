class ClinicsController < ApplicationController
  before_action :set_user
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  def index
    @clinics = Clinic.all
  end

  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @clinic = @user.clinics.find(params[:id])
    else
      @clinic = Clinic.find(params[:id])
      @user = @clinic.user
    end
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
    @clinic.update(clinic_params)
    redirect_to clinic_path(@clinic)
  end

  def destroy
    @clinic.destory
    redirect_to user_path(@user), status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:email, :phone_numer, :address, :description, :rate, :care_type, :webpage, :species)
  end
end
