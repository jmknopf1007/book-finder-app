class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
      end
    
      def show
        @review = Review.find(params[:id]) 
      end
    
      def new
        @review = Review.new 
      end
    
      def create
        @review = Review.new(review_params)
        @review.user = User.find(session[:user_id]) 
          if @review.save
            redirect_to review_path(@review)
          else
            render :new
          end
      end 
    
    #   def edit 
    #     @review = Review.find(params[:id]) 
    #   end
    
    #   def update
    #     @review = Review.find(params[:id])
    #     @review.update_attributes(review_params) 
    #     if @review.save
    #         redirect_to review_path(@review)  
    #     else
    #         render :edit 
    #     end
    # end
    
    # def destroy
    #     @review = Review.find(params[:id])
    #     @review.destroy
    #     redirect_to reviews_path(@reviews)   
    # end 
    
    
      private 
    
      def review_params
        params.require(:review).permit(:text, :user_id, :song_id) 
      end








end
