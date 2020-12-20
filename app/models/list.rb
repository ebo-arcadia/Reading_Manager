class List < ApplicationRecord
    belongs_to :reader
    belongs_to :genre
    has_many :books
    has_many :readers, through: :books
    # has_many :list_genres
    # has_many :genres, through: :list_genres

    validates :title, :description, presence: true
    
    # accepts_nested_attributes_for :books

    delegate :name, to: :genre

    # scope method works when active record relation is true and it can be chained to objects
    scope :list_by_order, -> { order(:title) }

    # def genre_attributes=(genre_attributes)
    #     genre_attributes.values.each do |genre_attribute|
    #         genre = Genre.find_or_create_by(genre_attribute)
    #         self.genre_attributes.build(genre: genre)
    # end 

    def genre_attributes=(genre)
        self.genre = Genre.find_or_create_by(name: genre[:name]) if !genre[:name].blank?
    end 
    
end
