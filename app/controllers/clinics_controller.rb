class ClinicsController < ApplicationController
  before_action :set_user
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      # Search clinics by address
      @clinics = Clinic.search_by_address(params[:query])
    else
      # Start with all clinics
      @clinics = Clinic.all

      # Filter by species if specified
      if params[:species].present? && params[:species] != 'All'
        @clinics = @clinics.where('species @> ARRAY[?]::varchar[]', params[:species])
      end

      # Filter by care type if specified
      if params[:care_type].present? && params[:care_type] != 'All'
        @clinics = @clinics.where('care_type @> ARRAY[?]::varchar[]', params[:care_type])
      end

      # Separate user clinics and all clinics for signed-in users?
      @user_clinics = @clinics.where(user_id: current_user.id) if user_signed_in?
      @all_clinics = @clinics unless user_signed_in?
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
    params.require(:clinic).permit(
      :email, :phone_numer, :address, :description, :rate, :webpage, :image, :clinic_name,
      { care_type: [] }, { species: [] }
    ).tap do |clinic_params|
      clinic_params[:care_type].reject!(&:blank?) if clinic_params[:care_type].is_a?(Array)
      clinic_params[:species].reject!(&:blank?) if clinic_params[:species].is_a?(Array)
    end
  end
end
