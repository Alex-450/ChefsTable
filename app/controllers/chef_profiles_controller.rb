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
    # make sure user does not have a chef profile yet
    @chef_profile = ChefProfile.find_by(user_id: current_user.id)
    if @chef_profile.present?
      # TODO: it would be better to return an error in this case
      redirect_to chef_profile_path(@chef_profile)
    else
      # create and save new chef profile
      @chef_profile = ChefProfile.create(chef_profile_params)
      @chef_profile.user_id = current_user.id
      if @chef_profile.save
        redirect_to chef_profiles_path
      else
        render :new
      end
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
