class List < ApplicationRecord
    belongs_to :reader
    has_many :books
    has_many :readers, through: :books
    has_many :list_genres
    has_many :genres, through: :list_genres

    validates :title, :description, presence: true
    
    accepts_nested_attributes_for :books

    scope :alpha, -> { order(:title) }

    def books_attributes=(book_attributes)
        book_attributes.values.each do |book_attribute|
            book = Book.find_or_create_by(book_attribute)
            self.book_attributes.build(book: book)
        end 
    end 
end
