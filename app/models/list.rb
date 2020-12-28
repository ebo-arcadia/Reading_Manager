class List < ApplicationRecord
    belongs_to :reader, dependent: :destroy
    belongs_to :genre, dependent: :destroy
    has_many :books, dependent: :destroy
    has_many :readers, through: :books, dependent: :destroy
    # has_many :list_genres
    # has_many :genres, through: :list_genres

    validates :title, :description, presence: true
    validates :description, length: { maximum: 10, too_long: "%{count} characters is the maximum allowed" }
    # custom validator max reading lists a reader can create a day
    validate :daily_create_list_limit
    # accepts_nested_attributes_for :books

    # enables class method genre.name is accessible to list object
    delegate :name, to: :genre

    # scope method enables lists listed in alpha order
    # it only works when active record relation is true and it can be chained to objects
    scope :list_by_order, -> { order(:title) }

    # nested attributes method accepts nested values via params
    def genre_attributes=(genre)
        self.genre = Genre.find_or_create_by(name: genre[:name]) if !genre[:name].blank?
    end 

    def daily_create_list_limit
        today_lists = reader.lists.select do |list|
            reader.created_at.to_date == Date.today
        end 
        if today_lists.size > 3
            errors.add(:reader_id, "can't created more than 3 reading lists per user a day")
        end
    end 

    def self.search(params)
        List.where("lists.title LIKE :term OR lists.description LIKE :term", term: "%#{params}%")
    end 
    
end
