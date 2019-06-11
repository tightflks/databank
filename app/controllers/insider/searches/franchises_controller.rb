class Insider::Searches::FranchisesController < ApplicationController
  helper Insider::Searches::SharedHelper
  helper Insider::Searches::SharedHelper::ContactInformation::Tabbed

  def index
    skip_policy_scope
    authorize Franchise, :index?

    @search = Insider::Search.new(Franchise, params)

    if @search.searching?
      render action: 'results'
    elsif @search.selecting?
      render action: 'selections'
    end
  end

  def show
    @franchise = Franchise.find(params[:id])
    authorize @franchise
  end

end
