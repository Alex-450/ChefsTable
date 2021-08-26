class ReviewsController < ApplicationController
  before_action :set_user_profile, only: [:new]

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @booking
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @booking
    if @review.save
      # redirect_to booking_path(@booking)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @booking = @review.booking
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:comment, :ratingss)
  end

  def set_user_profile
    @user_profile = current_user
  end


end
