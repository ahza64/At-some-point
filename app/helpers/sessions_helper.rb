module SessionsHelper

  def login(user)
    session[:user_id]
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(sessions[:user_id])
  end

  def logged_in?
    if current_user == nil
      redirect_to new_sessions_path
    end
  end

  def logout
    @current_user = session[:user_id] = nil
  end

end
