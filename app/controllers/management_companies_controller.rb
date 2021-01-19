class ManagementCompaniesController < ApplicationController
  def new
 @room = Room.find_by(id: params[:room_id])
      @management_company = ManagementCompany.find_by(room_id: @room.id)
  end

  def create
    @room = Room.find_by(id: params[:room_id])
    @management_company = ManagementCompany.new(management_company_params)
     if @management_company.save
      redirect_to admin_room_management_companies_path(params[:room_id], @review), notice: "#{@room.name}の'登録しました."

    end

  end
  def show
      @room = Room.find_by(id: params[:room_id])
      @management_company = ManagementCompany.find_by(room_id: @room.id)

  end


  private
  def management_company_params
    params.require(:management_company).permit(:name, :tel, :email, :url)

  end

end
