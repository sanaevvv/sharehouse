module Admin
     class RoomsController < ApplicationController
          layout 'admin'
          def index
               @rooms = Room.all
          end

          def show
               @room = Room.find(params[:id])
          end

          def new
               @room = Room.new
          end

          def edit
               @room = Room.find(params[:id])
          end

          def create
               @room = Room.new(room_params)
               if @room.save
               redirect_to admin_room_url(@room), notice:"#{@room.name}を登録しました。"
               else
               render :new
               end
          end

          def update
               @room = Room.find(params[:id])

               if @room.update(room_params)
               redirect_to admin_rooms_path, notice: "#{@room.name}を更新しました。"
               else
                    render :edit
               end

          end

          def destroy
               @room = Room.find(params[:id])
               @room.destroy
               redirect_to admin_rooms_path, notice: "#{@room.name}を削除しました。"
          end

          private
          def room_params
               params.require(:room).permit(:name, :price, :description, :image)
          end
     end
end
