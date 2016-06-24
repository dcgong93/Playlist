class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to singles_path
    else
      flash[:LI_errors] = ["Invalid Login"]
      redirect_to '/sessions'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions'
  end

end
