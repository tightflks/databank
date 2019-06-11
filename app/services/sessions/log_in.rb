class Sessions::LogIn

  def initialize(options)
    @username = options[:username]
    @password = options[:password]
  end

  def valid_username?
    user != nil
  end

  def valid_password?
    Pbkdf2PasswordHasher.check_password(@password, user.password) if user && @password
  end

  def active?
    user && user.is_active?
  end

  def user
    return @user if defined?(@user)

    if @username.blank?
      @user = nil
    else
      @user = User.where('lower(username) = ?', @username).first
    end
  end

end
