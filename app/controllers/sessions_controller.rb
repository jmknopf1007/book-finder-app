class SessionsController < ApplicationController
    skip_before_action :redirect_user
    # skip_before_action :verify_authenticity_token, only: [:new, :create]

    def login
    end

    def verify
        @user = User.find_by(username: params[:auth][:username]) 
        if @user && @user.authenticate(params[:auth][:password])     
            session[:user_id] = @user.id
            redirect_to songs_path 
        else 
            flash[:message] = "User not found, please try again."
            render :login
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

    def current_user
        @user = User.find(session[:user_id])
    end






end
