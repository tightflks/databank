require "rails_helper"

feature "Search -> Land " do
  include LoginSupport

  let!(:land)  { FactoryGirl.create(:land) }
  let!(:land2) { FactoryGirl.create(:land2) }

  it 'allows you to search and view a record' do
    login_as user
    visit insider_search_root_path
    click_link 'Land'
    fill_in 'Street name', with: 'Briarcliff'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'
    click_link 'CAMPUS CROSSING@BRIARCLIFF'


    expect(page).to have_content('CAMPUS CROSSING@BRIARCLIFF')
    expect(page).to have_content('EMORY UNIVERSITY/CAMPUS APARTMEN')
  end

  it 'allows you to search and select multiple records to view' do
    login_as user
    visit insider_search_root_path
    click_link 'Land'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'

    check "select_result_#{land.id}"
    check "select_result_#{land2.id}"
    click_button 'Submit'

    expect(page).to have_content('BRISTOL@BRIARCLIFF LOTS')
    expect(page).to have_content('CAMPUS CROSSING@BRIARCLIFF')
  end

  it "doesn't break when not entering any search criteria" do
    login_as user
    visit insider_search_root_path
    click_link 'Land'
    click_button 'Submit'

    expect(page).to have_link('BRISTOL@BRIARCLIFF LOTS')
  end

  describe 'Access Control' do
    it 'shows up as a link when you can access it' do
      login_as user
      visit insider_search_root_path
      expect(page).to have_link('Land')
    end

    it "doesn't show up as a link when you can't access it" do
      user.settings.update!(land: false)

      login_as user
      visit insider_search_root_path
      expect(page).not_to have_link('Land')
    end

    it 'allows users with land access' do
      login_as user
      visit insider_search_land_index_path
      expect(page.current_path).to eql(insider_search_land_index_path)
    end

    it 'denies users without land access' do
      user.settings.update!(land: false)

      login_as user
      visit insider_search_land_index_path
      expect(page).to have_content('You do not have permission to view that page.')
      expect(page.current_path).to eql(insider_search_root_path)
    end

    it 'requires login' do
      visit insider_search_land_index_path
      expect(page).to have_content('You must be logged in to access that page.')
      expect(page.current_path).to eql(insider_login_path)
    end
  end

end
