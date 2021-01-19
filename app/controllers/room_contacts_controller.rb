class RoomContactsController < ApplicationController
  def show

  end

  def new
    @room = Room.find_by(id: params[:room_id])
    @management_company = ManagementCompany.find_by(room_id: @room.id)

  end

  def create
    room_contact = RoomContact.new(room_contact_params)
     if room_contact.save
      redirect_to new_room_room_contact_path(room_id:@room.id), notice: "#{@room.name}の'問合わせ完了しました。"
    end

    private
  def room_contact_params
    params.require(:management_company).permit(:name, :email, :title, :body, :room_id)

  end


  end

end
