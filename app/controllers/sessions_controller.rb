class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      @error = "Your password was incorrect, please try again."
      render 'sessions/new.html.erb'
    end
  end

   def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end