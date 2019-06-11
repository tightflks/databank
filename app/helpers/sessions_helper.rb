module SessionsHelper

  def logged_in?
    current_user != nil
  end

  def login!(user)
    # TODO some better session security like an expiration token or something
    session[:user_id] = user.id
  end

  def logout!
    reset_session
  end

  def current_user
    return @current_user if defined?(@current_user)

    if session[:user_id]
      @current_user = User.where(id: session[:user_id]).first
    else
      @current_user = nil
    end
  end

end
