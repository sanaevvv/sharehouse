class RelationshipsController < ApplicationController




     # before_action :set_user

#   def create
#     following = current_user.follow(@user)
#     if following.save
#       flash[:success] = "ユーザーをフォローしました"
#       redirect_to @user
#     else
#       flash.now[:alert] = "ユーザーのフォローに失敗しました"
#       redirect_to @user
#     end
#   end

#   def destroy
#     following = current_user.unfollow(@user)
#     if following.destroy
#       flash[:success] = "ユーザーのフォローを解除しました"
#       redirect_to @user
#     else
#       flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
#       redirect_to @user
#     end
#   end

#   private
#   def set_user
#     @user = User.find(params[:relationship][:follow_id])
#   end

  def follow
    current_user.follow(params[:id])
    redirect_to user_path(params[:id])
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to user_path(params[:id])
  end

end

# end
