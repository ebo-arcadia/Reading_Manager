class BooksController < ApplicationController

    def index 
        if params[:list_id] && @list = List.find_by(id: params[:post_id])
        # if params[:list_id]
            # @books = List.find(params[:list_id]).books
            @books = @list.books
        else
            @error = "This list does not exist" if params[:list_id]
            @books = Book.all
        end 
    end 

    def new 
        @book = Book.new
    end 

    def create
        # @list = List.find(params(:list_id))
        # @book = @list.books.create(book_params)
        # redirect_to list_path(@list)
        @book = current_reader.books.build(book_params)
        if @book.save
            redirect_to book_path(@book)
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

    def update
        @book = Book.find_by(id: params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book)
        else 
            render :edit
        end 
    end 

    private

    def book_params
        params.require(:book).permit(:list_id, :title, :author, :note)
    end 


end
