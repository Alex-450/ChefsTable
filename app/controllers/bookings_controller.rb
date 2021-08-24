class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @chef_profile = ChefProfile.find(params[:chef_profile_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @chef_profile = ChefProfile.find(params[:chef_profile_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.chef_profile = @chef_profile
    authorize @booking
    if @booking.save
      redirect_to chef_profile_path(@chef_profile), notice: "Booking complete"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :chef_profile_id, :location, :cuisine, :booking_date)
  end
end
