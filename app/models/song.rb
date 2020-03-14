class Song < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :song_genres
    has_many :genres, through: :song_genres

    validates :name, presence: true
    validates :artist, presence: true
    validates :name, uniqueness: true
    validates :artist, uniqueness: true 


    # def self.search(search)
    #     if search
    #         #song = Song.where("artist like ?", "%#{search}%") 
    #         song = Song.find_by(artist: search.titleize) 
    #         if song 
    #             self.where(id: song.id) 
    #         else
    #             self.all
    #         end
    #     else
    #         self.all 
    #     end
    # end

    def self.search(search)
        if search
            song = Song.where("artist like ?", "%#{search}%".titleize) 
        else
            Song.all  
        end
    end



end
