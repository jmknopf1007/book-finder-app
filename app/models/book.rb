class Book < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :book_genres
    has_many :genres, through: :book_genres

    validates :title, presence: true
    validates :author, presence: true
    # validates :title, uniqueness: true
    # validates :author, uniqueness: true 


    # def self.search(search)
    #     if search
    #         #book = Book.where("author like ?", "%#{search}%") 
    #         book = Book.find_by(author: search.titleize) 
    #         if book 
    #             self.where(id: book.id) 
    #         else
    #             self.all
    #         end
    #     else
    #         self.all 
    #     end
    # end

    def self.search(search)
        if search
            book = Book.where("author like ?", "%#{search}%".titleize) 
        else
            Book.all  
        end
    end



end
