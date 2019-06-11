class Insider::Searches::IndustrialsController < ApplicationController
  helper Insider::Searches::SharedHelper
  helper Insider::Searches::SharedHelper::ContactInformation::Tabbed

  def index
    skip_policy_scope
    authorize Industrial, :index?

    @search = Insider::Search.new(Industrial, params)

    if @search.searching?
      render action: 'results'
    elsif @search.selecting?
      render action: 'selections'
    end
  end

  def show
    @industrial = Industrial.find(params[:id])
    authorize @industrial
  end

end
