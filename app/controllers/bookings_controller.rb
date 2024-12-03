class BookingsController < ApplicationController
  # Set the booking before showing, editing, updating or destroying
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings

  def index
    if current_user.role == 'vet'
      @bookings = Booking.joins(:clinic).where(clinics: { user_id: current_user.id }).order(:date, :time)
    else
      @bookings = Booking.joins(:pet).where(pets: { user_id: current_user.id }).order(:date, :time)
    end
    # Booking.all.order(:date, :time) # Order by date and time for readability
    @upcoming_bookings = @bookings.where("date >= ?", Date.today)
    @past_bookings = @bookings.where("date < ?", Date.today)
  end

  # GET /bookings/:id
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @clinic = Clinic.find(params[:clinic_id])
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)
    @clinic = Clinic.find(params[:clinic_id])
    @booking.clinic = @clinic
    @booking.pet.user.first_name = current_user.first_name if current_user.first_name.present?
    @booking.pet.user.last_name = current_user.last_name if current_user.last_name.present?
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # GET /bookings/:id/edit
  def edit
  end

  # PATCH/ /bookings/:id
  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/:id
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :description, :pet_id, :species, :care_type, :first_name, :last_name)
  end

  # Set the booking based on the ID in params
  def set_booking
    @booking = Booking.find(params[:id])
  end
end
