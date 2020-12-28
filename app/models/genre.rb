class Genre < ApplicationRecord
    has_many :lists, dependent: :destroy
    # has_many :list_genres
    # has_many :lists, through: :list_genres
end
