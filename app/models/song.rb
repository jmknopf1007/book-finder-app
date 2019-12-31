class Song < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :song_genres
    has_many :genres, through: :song_genres

    validates :name, presence: true
    validates :artist, presence: true
    validates :name, uniqueness: true
    validates :artist, uniqueness: true 
end
