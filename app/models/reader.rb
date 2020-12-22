class Reader < ApplicationRecord
    has_many :books, dependent: :destroy
    has_many :lists, dependent: :destroy
    has_many :genres, through: :lists, dependent: :destroy

    has_secure_password

    validates_presence_of :username, :email

    validates :username, uniqueness: true
    validates :email, uniqueness: true
    # validates :password, length: { in: 8..30 }


    def self.find_or_create_by_omniauth(access_token)
        self.where(email: access_token['info']['email']).first_or_create do |reader|
            reader.username = access_token['info']['first_name']
            reader.password = SecureRandom.hex(10)
        end 
    end 
        
end

