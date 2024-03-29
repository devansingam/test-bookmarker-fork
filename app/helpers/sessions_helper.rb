module SessionsHelper
  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user
    end
  end

  def logged_in?
    redirect_to new_session_path if current_user.nil?
  end
end
