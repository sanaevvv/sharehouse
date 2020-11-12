class ReviewsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @reviews = @room.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
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
    params.require(:review).permit(:room_id, :score, :comment)
  end

end
