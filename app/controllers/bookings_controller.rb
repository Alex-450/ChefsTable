class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @bookings = Booking.where(user_id: current_user)
    user_profiles = ChefProfile.where(user_id: current_user)
    @my_bookings = Booking.where(chef_profile_id: user_profiles)
    authorize @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @chef_profile = ChefProfile.find(params[:chef_profile_id])
    @cuisines = @chef_profile.cuisines
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
