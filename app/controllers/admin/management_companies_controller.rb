module Admin
  class ManagementCompaniesController < ApplicationController
layout 'admin'
    def new
      @rooms = Room.all
      @room = Room.find_by(id: params[:room_id])
      @management_company = ManagementCompany.new
    end

    def edit
      @room = Room.find_by(id: params[:room_id])
      @management_company = @room.management_company

    end

    def update
     room = Room.find_by(id: params[:room_id])
     management_company = ManagementCompany.find_by(room_id: room.id)

      if management_company.save
       redirect_to admin_room_management_companies_path(room),
       notice: "#{management_company.name}を更新しました。"
      else render:edit
      end
    end

    def delete
      room = Room.find_by(id: params[:room_id])
      management_company = ManagementCompany.find_by(room_id: @room.id)
      management_company.destroy
      redirect_to admin_room_management_companies_path(room),
      notice: "#{management_company.name}を削除しました。"
    end



    def create
      @room = Room.find_by(id: params[:room_id])
      @management_company = ManagementCompany.new(management_company_params)
      if @management_company.save
        redirect_to admin_room_management_companies_path(params[:room_id]),
        notice: "#{@management_company.name}を登録しました。"
      end
    end

    def show
      @room = Room.find_by(id: params[:room_id])
      @management_company = @room.management_company
    end

    private
    def management_company_params
      params.require(:management_company).permit(:name, :tel, :email, :url)

    end

  end

end
