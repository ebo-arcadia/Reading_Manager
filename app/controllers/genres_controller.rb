class GenresController < ApplicationController

    def index 
        @genres = Genre.all.includes(:lists)
    end 

    def show
        @genre = Genre.find_by(id: params[:id])
    end 

    def new
        @genre = Genre.new
    end 

end
