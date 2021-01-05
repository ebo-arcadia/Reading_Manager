class ReadersController < ApplicationController

    def new
        @reader = Reader.new
    end 

    def index
    end 

    def create
        @reader = Reader.new(reader_params)
        if @reader.save
            session[:reader_id] = @reader.id
            redirect_to reader_path(@reader)
        else
            render :new
        end 
    end 

    def show
    end 

    private
    
    def reader_params
        params.require(:reader).permit(:username, :email, :password)
    end 

end
