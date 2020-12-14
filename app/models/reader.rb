class Reader < ApplicationRecord
    has_many :books
    has_many :lists, through: :books

    # validates :username, :email, :password, presence: true

    validates :username, presence: { message: 'Please enter a valid username' }
    validates :email, presence: { message: 'Please enter a valid email' }
    validates :password, presence: { message: 'Please enter a valid password' }

    validates :username, uniqueness: { message: 'This username is taken, please enter another one'}
    validates :email, uniqueness: { message: 'This email is taken, please enter another one'}
    validates :password, length: { in: 8..20 }

end
