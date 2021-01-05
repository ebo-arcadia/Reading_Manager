class Book < ApplicationRecord
    belongs_to :reader
    belongs_to :list
    
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :author, presence: true

    scope :order_books_by_title, -> { order(:title) }
    # scope :group_books_by_author, -> { group(:author) }
end
