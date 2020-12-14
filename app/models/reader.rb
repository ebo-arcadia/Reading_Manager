class Reader < ApplicationRecord
    has_many :books
    has_many :lists, through: :books

    has_secure_password

    validates_presence_of :username, :email, :password

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true

    validates :username, uniqueness: true
    validates :email, uniqueness: true
    validates :password, length: { in: 8..20 }

    
end
