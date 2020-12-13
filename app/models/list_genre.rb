class ListGenre < ApplicationRecord
  belongs_to :list
  belongs_to :genre
end
