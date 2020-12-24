class UsersController < ApplicationController
  before_action :authenticate_user!

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

#   def bookmarks
#      @rooms = current_user.rooms
#   end



  # def following?(other_user)
  #   self.followings.include?(other_user)
  # end

  # def follow(other_user)
  #   unless self == other_user
  #     self.relationships.find_or_create_by(follow_id: other_user.id)
  #   end
  # end

  # def unfollow(other_user)
  #   relationship = self.relationships.find_by(follow_id: other_user.id)
  #   relationship.destroy if relationship
  # end


end
