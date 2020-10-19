class SessionsController < ApplicationController
    before_action :require_login, only: [:welcome, :destroy]


    def welcome
    end
  
    def new
    end
  
    def create
      user = User.find_by(name: params[:user][:name])
      user = user.try(:authenticate, params[:user][:password])     
      return redirect_to '/sessions/new' unless user
      session[:user_id] = user.id
      @user = user
      redirect_to '/'
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end
    
  end