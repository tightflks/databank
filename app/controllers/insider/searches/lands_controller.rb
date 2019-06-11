class Insider::Searches::LandsController < ApplicationController
  helper Insider::Searches::SharedHelper
  helper Insider::Searches::SharedHelper::ContactInformation::Tabbed

  def index
    skip_policy_scope
    authorize Land, :index?

    @search = Insider::Search.new(Land, params)

    if @search.searching?
      render action: 'results'
    elsif @search.selecting?
      render action: 'selections'
    end
  end

  def show
    @land = Land.find(params[:id])
    authorize @land
  end

end
