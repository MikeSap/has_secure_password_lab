class SessionsController < ApplicationController
    # helper_method :require_login


    def welcome
      # require_login
    end
  
    def new
    end
  
    def create
      user = User.find_by(name: params[:login][:user][:name])
      user = user.try(:authenticate, params[:login][:user][:password])      
      redirect_to('sessions/new') unless user
      session[:user_id] = user.id
      @user = user
      redirect_to '/'
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end
    
  end