class Reader < ApplicationRecord
    has_many :books
    has_many :lists
    has_many :genres, through: :lists

    has_secure_password

    validates_presence_of :username, :email, :password

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true

    validates :username, uniqueness: true
    validates :email, uniqueness: true
    validates :password, length: { in: 8..20 }


    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash['info']['email']).first_or_create do |reader|
            reader.password = SecureRandom.hex
        end 
    end 
        
end

