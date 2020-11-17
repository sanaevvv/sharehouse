class RoomsController < ApplicationController
  def index
    @rooms = Room.where(id: 21..25)
  end

  def show
    @room = Room.find(params[:id])
    @review = Review.new
  end

end
