class UsersController < ApplicationController
  before_action :authenticate_user!

  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def show
     @user = User.find(params[:id])
     @rooms = current_user.rooms
  end

  def new
     @user = User.new
  end

  def create
     @user = User.new(user_params)
    if @user.save
      redirect to user_path(@user), notice:"{#@user.username}様を登録しました。"
    else
      render :new
    end
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
     @user = User.find_by(id: params[:id])
     return redirect_to root_path if @user.blank?

     if @user.update(username: params[:profile])
          redirect_to @user, notice: "更新しました。"
     else render:edit
     end
  end

  def destroy
     user = User.find(params[:id])
     user.destroy
     redirect to user_path(@user), notice: "{#user.username}を削除しました。"
  end

#   def bookmarks
#      @rooms = current_user.rooms
#   end

  private
  def user_params
     params.require(:user).permit(:username, :email, :profile, :profile_image)
  end

end
