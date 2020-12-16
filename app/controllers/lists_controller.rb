class ListsController < ApplicationController

    def new 
        @list = List.new
        @list.books.build
    end 

    def create
        @list = current_reader.lists.build(list_params)
        if @list.valid?
            @list.save
            redirect_to list_path(@list)
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
