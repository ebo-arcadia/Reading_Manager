class BooksController < ApplicationController

    def index 
        # if params[:list_id] && @list = List.find_by(id: params[:post_id])
        if params[:list_id]
            @books = List.find(params[:list_id]).books
        else
            @books = Book.all
        end 
    end 

    def new 
        @book = Book.new
    end 

    def create
        raise params.inspect
        @list = List.find(params(:list_id))
        @book = @list.books.create(book_params)
        redirect_to list_path(@list)
    end 

    def show 
        @book = Book.find_by(id: params[:id])
    end 

    def edit
        @book = Book.find_by(id: params[:id])
    end 

    private
    def book_params
        params.require(:book).permit(:title, :author, :note)
    end 


end
