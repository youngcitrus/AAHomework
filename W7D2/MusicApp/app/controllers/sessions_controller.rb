class SessionsController < ApplicationController
  
  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login(user)
      redirect_to bands_url
    else
      redirect_to new_session_url
    end
  end

  def new
    render :new
  end

  def destroy
    logout(current_user)
    redirect_to new_session_url
  end
end