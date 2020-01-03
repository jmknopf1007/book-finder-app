class User < ApplicationRecord
    has_many :reviews
    has_many :songs, through: :reviews

    validates :username, presence: true
    validates :username, uniqueness: true 
    #validates :password_digest, presence: true
    #validates :password_digest, uniqueness: true 

    has_secure_password
end
