class ListsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_list_by_id, only: [:edit, :update]

    def new 
        # if params[:reader_id] && @reader = Reader.find_by(params[:reader_id])
        #     @list = @reader.posts.build
        # else 
            @list = List.new
        # end 
            @list.build_genre
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
                @lists = @reader.lists.list_by_order
            end 
        else 
            @error = "Reader does not exist" if params[:reader_id]
            @lists = List.list_by_order
        end 

        if params[:search] && !params[:search].empty?
            @lists = @lists.search(params[:search]).list_by_order
        end 
    end 

    def show
        @list = List.find_by_id(params[:id])
        redirect_to lists_path if !@list
    end 
    
    def edit
        
        if !@list || @list.reader != current_reader
            redirect_to lists_path
        end 
        @list.build_genre if !@list.genre
    end 

    def update
      
        if !@list || @list.reader != current_reader
            redirect_to lists_path
        end 
        if @list.update(list_params)
            redirect_to list_path(@list)
        else 
            render :edit
        end 
    end 

    def destroy
        @list = List.find(params[:id])
        @list.destroy
        redirect_to lists_path
    end 

    private

    def list_params
        params.require(:list).permit(:title, :description, :genre_id, genre_attributes: [:name])
    end 

    def set_list_by_id
        @list = List.find_by(id: params[:id])
    end 
  
end
