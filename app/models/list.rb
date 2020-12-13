class List < ApplicationRecord
    has_many :books
    has_many :readers, through: :books
    has_many :list_genres
    has_many :genres, through: :list_genres
end
