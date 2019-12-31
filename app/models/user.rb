class User < ApplicationRecord
    has_many :reviews
    has_many :songs, through: :reviews

    validates :username, presence: true
    validates :username, uniqueness: true 
    validates :password, presence: true
    validates :password, uniqueness: true 
end
