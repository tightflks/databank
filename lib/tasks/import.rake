namespace :import do

  task :fix_bad_data => :environment do
    Imports::FixBadData.new.perform
  end

end
