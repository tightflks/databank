class ApplicationController < ActionController::Base
  include Pundit
  include SessionsHelper

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  protect_from_forgery with: :exception

  before_action :ensure_logged_in
  before_action :ensure_active_user

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  private

  def ensure_logged_in
    unless logged_in?
      flash[:alert] = t('application.must_be_logged_in')
      redirect_to insider_login_path
    end
  end

  def ensure_active_user
    unless logged_in? && current_user.is_active?
      logout!
      flash[:alert] = t('application.marked_inactive')
      redirect_to insider_login_path
    end
  end

  def not_authorized
    respond_to do |f|
      f.js { render nothing: true, status: :forbidden }
      f.json { render nothing: true, status: :forbidden }
      f.all { redirect_to root_path, alert: t('application.not_authorized') }
    end
  end

end
