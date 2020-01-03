class GenresController < ApplicationController

    
      def show
        @Genre = Genre.find(params[:id]) 
      end
    
      def new
        @genre = Genre.new 
      end
    
      def create
        @genre = Genre.new(genre_params)
      
          if @genre.save
            redirect_to new_song_path
          else
            render :new
          end
      end 
    
    
      private 
    
      def genre_params
        params.require(:genre).permit(:name)
      end



end
