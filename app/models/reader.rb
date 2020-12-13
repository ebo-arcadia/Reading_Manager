class Reader < ApplicationRecord
    has_many :books
    has_many :lists, through: :books
end
