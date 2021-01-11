class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @room = Room.find_by(id: params[:room_id])
  end

  def new

  end

  def create
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
