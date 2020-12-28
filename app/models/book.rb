class Book < ApplicationRecord
    belongs_to :reader, dependent: :destroy
    belongs_to :list, dependent: :destroy
    
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :author, presence: true
end
