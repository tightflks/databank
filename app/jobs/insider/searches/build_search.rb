class Insider::Searches::BuildSearch < ApplicationJob

  def perform(search)
    query = search.klass

    query = query.property_name_like(search.property_name) unless search.property_name.blank?
    query = query.street_number_like(search.street_number) unless search.street_number.blank?
    query = query.street_name_like(search.street_name) unless search.street_name.blank?
    query = query.city_like(search.city) unless search.city.blank?
    query = query.county_like(search.county) unless search.county.blank?
    query = query.zipcode_like(search.zipcode) unless search.zipcode.blank?
    query = query.market_area_like(search.market_area) unless search.market_area.blank?
    query = query.district_like(search.district) unless search.district.blank?
    query = query.land_lot_like(search.land_lot) unless search.land_lot.blank?
    query = query.owner_name_like(search.owner_name) unless search.owner_name.blank?
    query = query.seller_like(search.seller) unless search.seller.blank?

    unless search.insider_date_end.blank?
      query = query.insider_date_before(parse_date(search.insider_date_end))
    end

    unless search.insider_date_start.blank?
      query = query.insider_date_after(parse_date(search.insider_date_start))
    end

    unless search.property_sale_date_start.blank?
      query = query.property_sale_date_after(parse_date(search.property_sale_date_start))
    end

    unless search.property_sale_date_end.blank?
      query = query.property_sale_date_before(parse_date(search.property_sale_date_end))
    end

    unless search.property_sale_price_low.blank?
      query = query.property_sale_price_over(search.property_sale_price_low)
    end

    unless search.property_sale_price_high.blank?
      query = query.property_sale_price_under(search.property_sale_price_high)
    end

    unless search.land_sale_date_end.blank?
      query = query.land_sale_date_before(parse_date(search.land_sale_date_end))
    end

    unless search.insider_date_start.blank?
      query = query.insider_date_after(parse_date(search.insider_date_start))
    end

    unless search.number_acres_low.blank?
      query = query.number_acres_over(search.number_acres_low)
    end

    unless search.number_acres_high.blank?
      query = query.number_acres_under(search.number_acres_high)
    end

    unless search.land_sale_price_low.blank?
      query = query.land_sale_price_over(search.land_sale_price_low)
    end

    unless search.land_sale_price_high.blank?
      query = query.land_sale_price_under(search.land_sale_price_high)
    end

    unless search.year_built_start.blank?
      start_date = "#{search.year_built_start.to_i}-01-01"
      query = query.year_built_after(start_date)
    end

    unless search.year_built_end.blank?
      end_date = "#{search.year_built_end.to_i}-12-31"
      query = query.year_built_before(end_date)
    end

    unless search.square_ft_start.blank?
      query = query.square_ft_over(search.square_ft_start)
    end

    unless search.square_ft_end.blank?
      query = query.square_ft_under(search.square_ft_end)
    end

    unless search.number_units_start.blank?
      query = query.number_units_over(search.number_units_start)
    end

    unless search.number_units_end.blank?
      query = query.number_units_under(search.number_units_end)
    end

    query = sort_search(search, query)

    query.all
  end

  def parse_date(date)
    Date.strptime(date, '%m/%d/%Y') rescue Date.today
  end

  private

  def sort_search(search, query)
    return query unless search.sort_by && search.sort_order

    query.send("by_#{search.sort_by}", search.sort_order)
  end

end
