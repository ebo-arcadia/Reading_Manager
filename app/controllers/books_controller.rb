class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    
    def index 
        if params[:list_id] && @list = List.find_by(id: params[:list_id])
        # if params[:list_id]
            # @books = List.find(params[:list_id]).books
            @books = @list.books.order_books_by_title
        else
            @error = "This list does not exist" if params[:list_id]
            @books = Book.all.order_books_by_title
        end 
    end 

    def new 
        if params[:list_id] && @list = List.find_by(id: params[:list_id])
            @book = @list.books.build
        else
            @error = "This list does not exist" if params[:list_id]
            @book = Book.new
        end 
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
    end 

    def edit
    end 

    def update
        if @book.update(book_params)
            redirect_to book_path(@book)
        else 
            render :edit
        end 
    end 

    def destroy
        @book.destroy
        redirect_to books_path
    end 

    private

    def book_params
        params.require(:book).permit(:list_id, :title, :author, :note)
    end 

    def set_book
        @book = Book.find_by(id: params[:id])
    end


end
