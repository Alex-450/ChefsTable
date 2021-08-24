class ChefProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_chef_profile, only: [:show, :destroy]

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
    @chef_profile.user_id = current_user.id
    if @chef_profile.save
      redirect_to chef_profile_path(@chef_profile)
    else
      render :new
    end
  end

  def destroy
    @chef_profile.destroy
    redirect_to chef_profiles_path
  end

  private

  def set_chef_profile
    @chef_profile = ChefProfile.find(params[:id])
  end

  def chef_profile_params
    params.require(:chef_profile).permit(:user_id, :cuisine, :location)
  end
end
