class ChangeSqFtBuilt < ActiveRecord::Migration[5.0]
  def change
    change_column :insider_databankoffshop, :land_sale_date, :date, null: true
    change_column :insider_databankoffshop, :foreclosure_date, :date, null: true
    change_column :insider_databankoffshop, :sale_date, :date, null: true
  end
end
