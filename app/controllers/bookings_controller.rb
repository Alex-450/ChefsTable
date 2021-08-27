class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @chef = current_user.chef_profile
    @bookings = current_user.bookings
    if @chef
      @my_profile = current_user.chef_profile
      @my_bookings = Booking.where(chef_profile_id: @my_profile)
    end
    authorize @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    @chef = current_user.chef_profile
    if @chef
      @my_booking = @booking.chef_profile_id == current_user.chef_profile.id
    end
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

  def update
    @booking = Booking.find(params[:id])
    if params[:status] =="accept"
      @booking.status = "accepted"
      @booking.save
      render :show
    elsif params[:status] =="reject"
      @booking.status = "rejected"
      @booking.save
      render :show
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :chef_profile_id, :location, :cuisine, :number_of_people, :number_of_courses, :booking_date)
  end
end
