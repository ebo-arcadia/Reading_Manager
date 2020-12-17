class ListsController < ApplicationController

    def new 
        if params[:reader_id] && @reader = Reader.find_by(params[:reader_id])
            @list = @reader.posts.build
        else 
            @list = List.new
        end 
    end 

    def create
        @list = current_reader.lists.build(list_params)
        if @list.save
            redirect_to lists_path
        else
            render :new
        end 
    end 

    def index 
        if params[:reader_id]
            if @reader = Reader.find_by(id: params[:reader_id])
                @lists = @reader.lists
            end 
        else 
            @error = "Reader does not exist" if params[:reader_id]
            @lists = List.includes(:reader)
        end 
    end 

    def show
        @list = List.find_by_id(params[:id])
        redirect_to lists_path if !@list
    end 


    def list_params
        params.require(:list).permit(:title, :description)
    end 
end
