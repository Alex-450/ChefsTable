class ChefProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_chef_profile, only: [:show, :destroy]

  def index
    @chef_profiles = policy_scope(ChefProfile).order(created_at: :desc)
    if params[:query].present?
      @chef_profiles = ChefProfile.search_by_cuisines_and_location_and_description(params[:query])
    elsif params[:cuisines].present?
      @chef_profiles = ChefProfile.search_by_cuisines(params[:cuisines])
    else
      @chef_profiles = ChefProfile.all
    end

  end


  def show
    # @booking = Booking.find(params[:booking_id])
    authorize @chef_profile
  end

  def new
    @chef_profile = ChefProfile.new
    authorize @chef_profile
  end

  def create
    @chef_profile = ChefProfile.create(chef_profile_params)
    @chef_profile.user_id = current_user.id
    authorize @chef_profile
    @chef_profile.cuisines = []
    ChefProfile::CUISINES.each do |cuisine|
      id = "cuisine-".concat(cuisine.parameterize)
      @chef_profile.cuisines.push(cuisine) if params.has_key?(id)
    end
    if @chef_profile.save
      redirect_to chef_profile_path(@chef_profile)
    else
      render :new
    end
  end

  def destroy
    authorize @chef_profile
    if Booking.exists?(chef_profile_id: @chef_profile.id)
      redirect_to chef_profile_path(@chef_profile), alert: 'You cannot delete your chef profile with active bookings!'
    else
      @chef_profile.destroy
      redirect_to chef_profiles_path
    end
    # authorize @chef_profile
  end

  private

  def set_chef_profile
    @chef_profile = ChefProfile.find(params[:id])
  end

  def chef_profile_params
    params.require(:chef_profile).permit(:user_id, :location, :description, :photo, cuisines: [])
  end
end
