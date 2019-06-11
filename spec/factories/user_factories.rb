FactoryGirl.define do

  factory :user, class: User do
    username 'dan'
    password 'asdf'
    is_superuser false
    first_name 'Dan'
    last_name 'Cunning'
    email 'dan@topdan.com'
    is_staff false
    is_active true
    last_login Time.at(0)
    date_joined '2017-02-09'

    after(:create) do |user|
      FactoryGirl.create(:user_settings, user: user)
    end
  end

end
