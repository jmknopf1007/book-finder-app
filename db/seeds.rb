require 'faker' 

Book.delete_all
Book.reset_pk_sequence
User.delete_all
User.reset_pk_sequence
Review.delete_all
Review.reset_pk_sequence
Genre.delete_all
Genre.reset_pk_sequence
BookGenre.delete_all
BookGenre.reset_pk_sequence 


10.times do |i|
    Book.create(name: Faker::Book.unique.title, author: Faker::Book.unique.author) 
end 

puts "bookseedingsuccess" 

# 10.times do |i|
#     User.create(username: Faker::FunnyName.unique.name, password: Faker::Hacker.unique.verb)   
# end

jacob = User.create(username: "jmknopf", password: "j", password_confirmation: "j") 
tia = User.create(username: "tiann", password: "t", password_confirmation: "t") 
matthew = User.create(username: "mattman", password: "m", password_confirmation: "m") 
fred = User.create(username: "freddy", password: "f", password_confirmation: "f") 
george = User.create(username: "georgie", password: "g", password_confirmation: "g")  

puts "userseedingsuccess" 

10.times do |i|
    Genre.create(name: Faker::Book.unique.genre)   
end

puts "genreseedingsuccess" 

10.times do |i|
    Review.create(user_id: User.all.sample.id, book_id: Book.all.sample.id, text: Faker::TvShows::BojackHorseman.unique.quote) 
end

puts "reviewseedingsuccess" 

10.times do |i|
    BookGenre.create(book_id: Book.all.sample.id, genre_id: Genre.all.sample.id)  
end

puts "bookgenreseedingsuccess" 



