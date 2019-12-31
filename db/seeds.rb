require 'faker' 

Song.delete_all
Song.reset_pk_sequence
User.delete_all
User.reset_pk_sequence
Review.delete_all
Review.reset_pk_sequence
Genre.delete_all
Genre.reset_pk_sequence
SongGenre.delete_all
SongGenre.reset_pk_sequence 


10.times do |i|
    Song.create(name: Faker::Hipster.unique.word, artist: Faker::Music.unique.band) 
end 

puts "songseedingsuccess" 

# 10.times do |i|
#     User.create(username: Faker::FunnyName.unique.name, password: Faker::Hacker.unique.verb)   
# end

jacob = User.create(username: 'jmknopf', password: "j") 
tia = User.create(username: 'tiann', password: "t") 
matthew = User.create(username: 'mattman', password: "m") 
fred = User.create(username: 'freddy', password: "f") 
george = User.create(username: 'georgie', password: "g") 

puts "userseedingsuccess" 

10.times do |i|
    Genre.create(name: Faker::Music.unique.genre)   
end

puts "genreseedingsuccess" 

10.times do |i|
    Review.create(user_id: User.all.sample.id, song_id: Song.all.sample.id, text: Faker::TvShows::BojackHorseman.unique.quote) 
end

puts "reviewseedingsuccess" 

10.times do |i|
    SongGenre.create(song_id: Song.all.sample.id, genre_id: Genre.all.sample.id)  
end

puts "songgenreseedingsuccess" 



