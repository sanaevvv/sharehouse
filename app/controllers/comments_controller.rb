class CommentsController < ApplicationController
  def create
    # @room = Room.find(params[:room_id])
    # @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path, notice: 'コメントの保存に成功しました.'

    end
      # redirect_to room_review_path(room_id: review.room.id, params[id: review.id]) notice: 'コメントの保存に成功しました.'

    #  redirect_to room_reviews_path(room_id: review.room.id), notice: 'コメントの保存に成功しました.'
  end

  def edit
  end

  def update
    comment = Comment.find(params[:id])
    comment.update
  end

  # def destroy
  #   comment = Comment.find_by(review_id: params[:review_id] comment)
  #   comment.destroy
  # end

  private
  def comment_params
    params.require(:comment).permit(:body, :review_id)
  end
end
