class RoomsController < ApplicationController
  def index
    # @rooms = Room.all

    # 検索フォームの入力内容で検索する
    @q = Room.ransack(params[:q])
    # 重複を排除
    @rooms = @q.result(distinct: true)
  end

  def show
    @room = Room.find(params[:id])
    @review = Review.new
  end

end
