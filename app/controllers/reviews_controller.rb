class ReviewsController < ApplicationController
  before_action :set_booking
  before_action :set_review, only: %i[edit update destroy]

  def new
    @review = @booking.build_review
  end

  def create
    @review = @booking.build_review(review_params)
    @review.user = current_user

    if @review.save
      redirect_to booking_path(@booking), notice: 'Review successfully added!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      redirect_to booking_path(@booking), notice: 'Review updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to booking_path(@booking), notice: 'Review deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = @booking.review
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
