class Book < ApplicationRecord
    belongs_to :reader
    belongs_to :list
    
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :author, presence: true
end
