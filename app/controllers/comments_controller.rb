class CommentsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @comment = Comment.new(comment_params)
    @review = Review.find(params[:review_id])
    if @comment.save
      redirect_to room_review_path(params[:room_id], @review), notice: 'コメントの保存に成功しました.'
    end
  end

  def edit
    @room    = Room.find(params[:room_id])
    @review  = Review.find(params[:review_id])
    @comment = Comment.find_by(id: params[:id])

  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to room_review_path(params[:room_id], params[:review_id])
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    redirect_to room_review_path(params[:room_id], params[:review_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :review_id)
  end
end
