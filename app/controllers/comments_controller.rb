class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
     redirect_to room_review_path(room_id: review.room.id, params[id: review.id]), notice: 'コメントの保存に成功しました.'
    # ◯ redirect_to root_path, notice: 'コメントの保存に成功しました.'
    # x redirect_to room_reviews_path(room_id: review.room), notice: 'コメントの保存に成功しました.'
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :name, :review_id)
  end

end
