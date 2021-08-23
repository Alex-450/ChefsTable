class ChefProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_chef_profile, only: :show

  def index
    @chef_profiles = ChefProfile.all
  end

  def show
  end

  def new
    @chef_profile = ChefProfile.new
  end

  def create
    @chef_profile = ChefProfile.create(chef_profile_params)
    if chef_profile.save
      redirect_to chef_profiles_path
    else
      render :new
    end
  end

  private

  def set_chef_profile
    @chef_profile = ChefProfile.find(params[:id])
  end

  def chef_profile_params
    params.require(:chef_profile).permit(:user_id)
  end
end
