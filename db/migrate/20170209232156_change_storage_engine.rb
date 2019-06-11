class ChangeStorageEngine < ActiveRecord::Migration[5.0]
  def change
    conn = ActiveRecord::Base.connection

    conn.tables.each do |table_name|
      conn.execute "ALTER TABLE #{table_name} ENGINE = InnoDB;"
    end
  end
end
