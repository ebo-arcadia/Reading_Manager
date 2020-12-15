class Book < ApplicationRecord
    belongs_to :reader
    belongs_to :list

    def create
        @list = List.find(params[:list_id])
        @book = @list.books.create(book_params)
        redirect_to list_path(@list)
    end 

    private 
        def book_params
            params.require(:book).permit(:title, :author, :note)
        end 
        
end
