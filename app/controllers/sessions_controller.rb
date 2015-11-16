class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: login_params[:email])
    @user = user.authenticate(login_params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.email}"
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
