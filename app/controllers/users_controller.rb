class UsersController < ApplicationController
    skip_before_action :redirect_user, only: [:new, :create]
    # skip_before_action :verify_authenticity_token, only: [:new, :create]

    
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:message] = "Account created, please log in."
            redirect_to login_path  
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update_attributes(user_params) 
        if @user.save
            flash[:message] = "Account successfully updated."
            redirect_to user_path(@user)   
        else
            render :edit 
        end
    end

    def destroy
        @user = User.find(params[:id])
        Review.where(user_id: session[:user_id]).destroy_all
        @user.destroy
        session.clear
        redirect_to '/login' 
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

    # def find_user
    #     @user = User.find(params[:id])
    # end





end
