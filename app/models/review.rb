class Review < ApplicationRecord
    belongs_to :song
    belongs_to :user

    validates :text, presence: true 
end
