module Admin
     class RoomsController < ApplicationController

          def index
               @rooms = Room.where(id: 21..25)
          end

          def edit
               
          end

          def new
          end

          def show
          end


     end
end
