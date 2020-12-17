class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(room_id: params[:room_id])
    bookmark.save!
    redirect_to rooms_path
  end

  def destroy
    current_user.bookmarks.find_by(room_id: params[:room_id]).destroy
    redirect_to rooms_path
  end
end
