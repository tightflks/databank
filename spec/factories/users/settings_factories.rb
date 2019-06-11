FactoryGirl.define do

  factory :user_settings, class: Users::Settings do
    apartment true
    retail true
    land true
    offshop true
    industrial true
    reportcount 0
    company_name 'Cunning Simplicity, Inc.'
    company_street '123 Fake St'
    company_city 'Atlanta'
    company_state 'GA'
    company_zip '30303'
    company_number '555-5555'

    association :user
  end

end
