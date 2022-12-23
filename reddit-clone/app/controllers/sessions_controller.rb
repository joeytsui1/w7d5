class SessionsController < ApplicationController
    before_action :require_log_in, only: [:new, :create]
    before_action :require_log_out, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password]) 
        if @user
            login!(@user)
            redirect_to users_url
        else
            flash.now[:errors] = ["Invalid Credentials or whatever"]
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

end