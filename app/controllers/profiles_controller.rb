class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.includes(:user).order(created_at: 'DESC')
    # @likes_count = Like.where(profile_id: profile.id).count
  end

  def show
    @profile = Profile.find(params[:id])
    @likes_count = Like.where(profile_id: @profile.id).count
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    if @profile.save
      redirect_to "/profiles/#{@profile.id}"
    else
      render action: :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to "/profiles/#{@profile.id}"
    else
      render action: :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:self_pr, :sex_id, :age, :residence_id, :rope_patron_id, :image).merge(user_id: current_user.id)
  end
end
