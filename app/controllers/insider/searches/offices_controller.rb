class Insider::Searches::OfficesController < ApplicationController
  helper Insider::Searches::SharedHelper
  helper Insider::Searches::SharedHelper::ContactInformation::Tabbed

  def index
    skip_policy_scope
    authorize Office, :index?

    @search = Insider::Search.new(offices, params)

    if @search.searching?
      render action: 'results'
    elsif @search.selecting?
      render action: 'selections'
    end
  end

  def show
    @office = offices.find(params[:id])
    authorize @office
  end

  private

  def offices
    Office.not_project_type('S')
  end

end
