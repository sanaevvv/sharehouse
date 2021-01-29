module Admin
     class RoomsController < ApplicationController
          layout 'admin'
          def index
               # @rooms = Room.all

               # 検索フォームの入力内容で検索する
               @q = Room.ransack(params[:q])
               # 重複を排除
               @rooms = @q.result(distinct: true).page(params[:page]).per(5)


          end

          def show
               @room = Room.find(params[:id])
          end

          def new
            @room = Room.new

          end

          def edit
               @room = Room.find_by(id: params[:id])

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
               room = Room.find_by(id: params[:id])
               if room.save
               redirect_to admin_rooms_path, notice: "#{room.name}を更新しました。"
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
            params.require(:room).permit(:name, :price, :description, :maxprice, :tag_list, :image, :management_company_id)
          end
     end
end
