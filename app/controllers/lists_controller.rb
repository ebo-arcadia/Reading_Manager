class ListsController < ApplicationController

    def new 
        @list = List.new
    end 

    def create
        @list = current_reader.lists.build(list_params)
        if @list.valid?
            @list.save
            redirect_to lists_path
        else
            render :new
        end 
    end 

    def show
        @list = List.find_by(id: params[:id])
    end 


    def list_params
        params.require(:list).permit(:title, :description)
    end 
end
