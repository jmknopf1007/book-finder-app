class Book < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :book_genres
    has_many :genres, through: :book_genres

    validates :name, presence: true
    validates :author, presence: true
    validates :name, uniqueness: true
    validates :author, uniqueness: true 


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
            book = Book.where("artist like ?", "%#{search}%".titleize) 
        else
            Book.all  
        end
    end



end
