class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to bookmarks_path
    else
    end
  end

  def create
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to bookmarks_path
    else
      render 'new'
    end
  end

  private

    def login_params
      params.require(:session).permit(:email, :password)
    end
end
