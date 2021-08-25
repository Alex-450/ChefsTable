class ChefProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_chef_profile, only: [:show, :destroy]

  def index
    @chef_profiles = policy_scope(ChefProfile).order(created_at: :desc)
  end

  def show
    authorize @chef_profile
  end

  def new
    @chef_profile = ChefProfile.new
    @cuisines = ['Italian', 'French', 'Vegan', 'Indonesian', 'Japanese', 'Chinese', 'Russian']
    authorize @chef_profile
  end

  def create
    @chef_profile = ChefProfile.create(chef_profile_params)
    @chef_profile.user_id = current_user.id
    authorize @chef_profile
    # raise
    if @chef_profile.save
      redirect_to chef_profile_path(@chef_profile)
    else
      @cuisines = ['Italian', 'French', 'Vegan', 'Indonesian', 'Japanese', 'Chinese', 'Russian']
      render :new
    end
  end

  def destroy
    authorize @chef_profile
    @chef_profile.destroy
    redirect_to chef_profiles_path
    authorize @chef_profile
  end

  private

  def set_chef_profile
    @chef_profile = ChefProfile.find(params[:id])
  end

  def chef_profile_params
    params.require(:chef_profile).permit(:user_id, :location, :photo, cuisines: [])
  end
end
