class FollowsController < ApplicationController
#   before_action :authenticate_user!

#   # def create
#   #   current_user.follow(params[:id])
#   #   redirect_to user_path(params[:id])
#   # end

#   # def destroy
#   #   current_user.unfollow(params[:id])
#   #   redirect_to user_path(params[:id])
#   # end

# def create
#    follow_user_id = params[:follow_user_id].to_i
#    if current_user.id == follow_user_id
#      flash[:notice] = '自身をフォローすることはできません'
#    else
#      @user = current_user
#      follow = current_user.follows.new(follow_params)
#      follow.save
#    end
#    redirect_to user_path(User.find(follow_user_id))
#  end

#  def destroy
#   current_user.unfollow(params[:id])
#    Follow.where(user_id: current_user.id, follower_user_id: params[:follower_user_id]).destroy_all
#    redirect_to user_path(User.find(params[:follow_user_id]))
#  end

#  private
#  def follow_params
#    params.permit(:user_id, :follow_user_id)
#  end



end
