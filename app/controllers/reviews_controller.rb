class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @room = Room.find(params[:room_id])
    # @reviews = @room.reviews
    @q = @room.reviews.ransack(params[:q])
    @reviews = @q.result(distinct:true).page(params[:page]).per(5)


  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id #誰が投稿したかを格納
    if
      @review.save
      redirect_to room_reviews_path(@review.room)
    else
      @room = Room.find(params[:room_id])
      render "rooms/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:room_id, :score, :comment, :tag_list)
  end

end
