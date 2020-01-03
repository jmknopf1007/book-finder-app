class UsersController < ApplicationController
    skip_before_action :redirect_user, only: [:new, :create]
    
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to user_path(@user) 
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
            redirect_to user_path(@user)   
        else
            render :edit 
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to songs_path(@songs) 
    end

    private

    def user_params
        params.require(:user).permit(:username, :password_digest, :password_confirmation)
    end

    # def find_user
    #     @user = User.find(params[:id])
    # end





end
