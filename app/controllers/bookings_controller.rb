class BookingsController < ApplicationController
  # Set the booking before showing, editing, updating or destroying
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  def index
    @bookings = Booking.all
  end

  # GET /bookings/:id
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
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
      redirect_to @booking, notice: 'Booking was successfully updated.'
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

  # Set the booking based on the ID in params
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow trusted parameters
  def booking_params
    params.require(:booking).permit(:date, :time, :description)
  end

end
