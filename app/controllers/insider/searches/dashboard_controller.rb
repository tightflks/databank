class Insider::Searches::DashboardController < ApplicationController
  skip_after_action :verify_authorized, only: :show

  def show
  end

end
