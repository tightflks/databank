class Imports::FixBadData < ActiveJob::Base

  def perform
    fix_office_590

    ActiveRecord::Base.connection.execute %q{
      UPDATE `insider_databankoffshop` SET `insider_databankoffshop`.`land_sale_date` = NULL WHERE CAST(land_sale_date AS CHAR(10)) = '0000-00-00';
    }

    ActiveRecord::Base.connection.execute %q{
      UPDATE `insider_databankoffshop` SET `insider_databankoffshop`.`foreclosure_date` = NULL WHERE CAST(foreclosure_date AS CHAR(10)) = '0000-00-00';
    }

    ActiveRecord::Base.connection.execute %q{
      UPDATE `insider_databankoffshop` SET `insider_databankoffshop`.`sale_date` = NULL WHERE CAST(sale_date AS CHAR(10)) = '0000-00-00';
    }
  end

  private

  def fix_office_590
    Office.where(id: 590).first
  rescue Mysql2::Error
    Office.where(id: 590).update_all foreclosure_date: '2015-05-01'
  end

end
