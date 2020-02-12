class SongsController < ApplicationController

    def index
        #@songs = Song.all
        @songs = Song.search(params[:search]) 
      end
    
      def show
        @song = Song.find(params[:id])
        @reviews = Review.where(song_id: @song.id)  
        @genres = @song.genres
      end
    
      def new
        @song = Song.new 
      end
    
      def create
        @song = Song.new(song_params)
      
          if @song.save
            redirect_to song_path(@song)
          else
            render :new
          end
      end 
    
      def edit 
        @song = Song.find(params[:id]) 
      end
    
      def update
        @song = Song.find(params[:id])
        @song.update_attributes(song_params) 
        if @song.save
            redirect_to song_path(@song)  
        else
            render :edit 
        end
    end
    
    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path(@songs)   
    end 
    
    
      private 
    
      def song_params
        params.require(:song).permit(:name, :artist, :search, {:genre_ids => []})   
      end
    


end
