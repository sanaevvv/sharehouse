class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :user_admin, only: [:show]

  def index
      @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @room = Room.find(params[:id])
    # @rooms = current_user.rooms
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
    user = User.find_by(id: params[:id])
    return redirect_to root_path if user.blank?

    user.profile = params[:user][:profile]
    user.username = params[:user][:username]
    user.email = params[:user][:email]
    user.profile_image = params[:user][:profile_image] if params[:user][:profile_image].present?

    if user.save
      redirect_to user, notice: "更新しました。"
    else render:edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect to user_path(@user), notice: "{#@user.username}を削除しました。"
  end


# private
#   def user_admin
#     if  current_user.admin == false
#         redirect_to root_path
#     else
#         render action: "show"
#     end
#   end

end
