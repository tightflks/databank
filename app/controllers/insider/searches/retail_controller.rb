class Insider::Searches::RetailController < ApplicationController
  helper Insider::Searches::SharedHelper
  helper Insider::Searches::SharedHelper::ContactInformation::Tabbed

  def index
    skip_policy_scope
    authorize Office, :index?

    @search = Insider::Search.new(offices, params)

    if @search.searching?
      render template: 'insider/searches/offices/results'
    elsif @search.selecting?
      render template: 'insider/searches/offices/selections'
    else
      render template: 'insider/searches/offices/index'
    end
  end

  def show
    @office = offices.find(params[:id])
    authorize @office

    render template: 'insider/searches/offices/show'
  end

  private

  def offices
    Office.not_project_type('O')
  end

end
