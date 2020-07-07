class BooksController < ApplicationController

    def index
        #@books = Book.all
        @books = Book.search(params[:search]) 
      end
    
      def show
        @book = Book.find(params[:id])
        @reviews = Review.where(book_id: @book.id)  
        @genres = @book.genres
      end
    
      def new
        @book = Book.new 
      end
    
      def create
        @book = Book.new(book_params)
      
          if @book.save
            redirect_to book_path(@book)
          else
            render :new
          end
      end 
    
      def edit 
        @book = Book.find(params[:id]) 
      end
    
      def update
        @book = Book.find(params[:id])
        @book.update_attributes(book_params) 
        if @book.save
            redirect_to book_path(@book)  
        else
            render :edit 
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path(@books)   
    end 
    
    
      private 
    
      def book_params
        params.require(:book).permit(:title, :author, :search, genre_ids: [])    
      end
    


end
