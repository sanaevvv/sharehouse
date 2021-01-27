class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @room = Room.find_by(id: params[:room_id])
    return redirect_to root_path if @room.blank?

    # @reviews = @room.reviews
    @q = @room.reviews.ransack(params[:q])
    @reviews = @q.result(distinct:true).page(params[:page]).per(5)

  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id # 投稿作成時にログインしているユーザーのidを格納
    if
      @review.save
      redirect_to room_reviews_path(@review.room)
    else
      @room = Room.find(params[:room_id])
      render "rooms/show"
    end

  end

  def edit

  end



  def new
    @review = Review.new
  end

  def show
    @room = Room.find_by(id: params[:room_id])
    @review = Review.find(params[:id])
    @comment = @review.comments.build
  end

  private
  def review_params
    params.require(:review).permit(:room_id, :score, :comment, :tag_list)
  end

end
