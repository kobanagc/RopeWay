class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(user_id:current_user.id, profile_id:params[:profile_id])
    @like.save
    redirect_to("/profiles/#{params[:profile_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, profile_id: params[:profile_id])
    @like.destroy
    redirect_to("/profiles/#{params[:profile_id]}")
  end

end