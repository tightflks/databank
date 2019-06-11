class Insider::Searches::ApartmentsController < ApplicationController
  helper Insider::Searches::SharedHelper
  helper Insider::Searches::SharedHelper::ContactInformation::Flat

  def index
    skip_policy_scope
    authorize Apartment

    @search = Insider::Search.new(Apartment, params)

    if @search.searching?
      render action: 'results'
    elsif @search.selecting?
      render action: 'selections'
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
    authorize @apartment
  end

end
