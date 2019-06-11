class Insider::Search

  Properties = [
    'property_name',
    'description',
    'street_number',
    'street_name',
    'city',
    'county',
    'zipcode',
    'market_area',
    'district',
    'land_lot',

    'insider_date_start',
    'insider_date_end',
    'property_sale_date_start',
    'property_sale_date_end',

    'property_sale_price_low',
    'property_sale_price_high',

    'land_sale_date_start',
    'land_sale_date_end',

    'number_acres_low',
    'number_acres_high',
    'land_sale_price_low',
    'land_sale_price_high',
    'owner_name',

    'year_built_start',
    'year_built_end',

    'square_ft_start',
    'square_ft_end',
    'number_units_start',
    'number_units_end',
    'seller',
  ]

  Columns = %w[
    property_name
    address
    city
    zipcode
    county
    insider_date
    sale_date
    year_built
    description
    owner
  ]

  Properties.each do |property|
    attr_accessor property.to_sym
  end

  attr_reader :klass
  attr_reader :sort_by
  attr_reader :sort_order
  attr_reader :params

  def initialize(klass, params = {})
    @klass = klass
    @params = {}

    @sort_by = params[:sort_by]
    @sort_by = nil unless Columns.include?(@sort_by)

    @sort_order = params[:sort_order]
    @sort_order = 'asc' unless %w[asc desc].include?(@sort_order)

    params.each do |key, value|
      next unless Properties.include?(key)
      send("#{key}=", value)
      @params[key] = value
      @is_performed = true
    end

    @select_result_ids = params['select_results']
    @select_result_ids = nil unless @select_result_ids.is_a?(Array)
  end

  def searching?
    @is_performed
  end

  def search_results
    @search_results ||= Insider::Searches::BuildSearch.new.perform(self)
  end

  def selecting?
    @select_result_ids && @select_result_ids.any?
  end

  def select_results
    @select_results ||= @klass.where(id: @select_result_ids)
  end

  def opposite_sort_order
    sort_order == 'asc' ? 'desc' : 'asc'
  end

  def model_name
    ActiveModel::Name.new(self.class)
  end

  def to_key
    []
  end

end
