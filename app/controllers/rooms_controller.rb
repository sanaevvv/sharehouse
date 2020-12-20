class RoomsController < ApplicationController
  def index
    # @rooms = Room.all

    # 検索フォームの入力内容で検索する
    @q = Room.ransack(params[:q])
    # 重複を排除/ページ番号に対応するデータ範囲検索
    @rooms = @q.result(distinct: true).page(params[:page]).per(5)
    
  end

  def show
    @room = Room.find(params[:id])
    @review = Review.new
  end

  def edit

  end



end
