class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
    redirect_to @comment.review, notice: 'コメントの保存に成功しました.'
    end
  end

  def new
    @review = Review.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :name)
  end

end
