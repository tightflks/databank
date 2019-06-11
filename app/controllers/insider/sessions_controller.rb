class Insider::SessionsController < ApplicationController
  skip_before_action :ensure_logged_in
  skip_before_action :ensure_active_user
  skip_after_action :verify_authorized

  layout 'sessions'

  def new
  end

  def create
    @login = Sessions::LogIn.new(session_params)

    if !@login.valid_username? || !@login.valid_password?
      flash[:alert] = t('insider.sessions.create.invalid_credentials')
      redirect_to action: 'new'

    elsif !@login.active?
      flash[:alert] = t('insider.sessions.create.not_active')
      redirect_to action: 'new'

    else
      login!(@login.user)
      flash[:notice] = t('insider.sessions.create.success')
      redirect_to insider_root_path
    end
  end

  def destroy
    logout!
    flash[:notice] = t('insider.sessions.destroy.success')
    redirect_to action: 'new'
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

end
