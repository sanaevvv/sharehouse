module Admin
  class PhotosController < ApplicationController
    layout 'admin'
    def index
      @photos = Photo.all
      @room = Room.find_by(id: params[:room_id])
    end

    def new
      @room = Room.find_by(id: params[:room_id])
      @photo = @room.photos.build

    end

    def edit
      @room = Room.find_by(id: params[:room_id])
      @photo = Photo.find_by(id: params[:id])

    end

    def create
       @room = Room.find_by(id: params[:room_id])
       @photo = @room.photos.build(image_params)
    if @photo.save
      redirect_to admin_room_photos_path(room_id:@room.id), notice: "#{@photo.title}の写真を登録しました。"
    else
      render :new
    end

    end

    def update
    photo = Photo.find_by(id:params[:id])
    # photo.update(image_params)
    # redirect_to admin_room_photos_path(params[:room_id])

    photo.title = params[:photo][:title]
    photo.body = params[:photo][:body]
    photo.photo_image = params[:photo][:photo_image] if params[:photo][:photo_image].present?

      if photo.save
       redirect_to admin_room_photos_path(params[:room_id]), notice: "#{photo.title}を更新しました。"
      else render:edit
      end

    end

    def destroy
    photo = Photo.find_by(id: params[:id])
    photo.destroy
    redirect_to admin_room_photos_path(params[:room_id])

    end

     private
     def image_params
      params.require(:photo).permit(:title, :body, :photo_image)

  end


  end
end