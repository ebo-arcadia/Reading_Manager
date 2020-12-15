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
        @book = current_reader.books.build(book_params)
        if @book.save
            redirect_to books_path
        else
            render :new
        end 
    end 

    def show 
        @book = Book.find_by(id: params[:id])
    end 

    def edit
        @book = Book.find_by(id: params[:id])
    end 

    def book_params
        params.require(:book).permit(:title, :author, :note)
    end 


end
