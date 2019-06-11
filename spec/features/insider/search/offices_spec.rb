require "rails_helper"

feature "Search -> Offices" do
  include LoginSupport

  let!(:office) { FactoryGirl.create(:office) }
  let!(:office2) { FactoryGirl.create(:office2) }

  before do
    office.update!(PROJECT_TYPE: 'O')
  end

  it 'allows you to search and view a record' do
    login_as user
    visit insider_search_root_path
    click_link 'Offices'
    fill_in 'Street name', with: 'Briarcliff'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'
    click_link 'BRIARCLIFF RD#4805'

    expect(page).to have_content('BRIARCLIFF RD#4805')
    expect(page).to have_content('BROKERED 12/28/16')
    expect(page).to have_content('$4,200,000')
    expect(page).to have_content('MALAKSHMI LLC/GOGINENI')
  end

  it 'allows you to search and select multiple records to view' do
    login_as user
    visit insider_search_root_path
    click_link 'Offices'
    fill_in 'Street name', with: 'Briarcliff'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'

    check "select_result_#{office.id}"
    check "select_result_#{office2.id}"
    click_button 'Submit'

    expect(page).to have_content('BRIARCLIFF RD#4805')
    expect(page).to have_content('CHILDRENS HEALTHCARE')
  end

  it "doesn't break when not entering any search criteria" do
    login_as user
    visit insider_search_root_path
    click_link 'Offices'
    click_button 'Submit'

    expect(page).to have_link('BRIARCLIFF RD#4805')
  end

  it "doesn't return records with PROJECT_TYPE 'S'" do
    office.update!(PROJECT_TYPE: 'S')

    login_as user
    visit insider_search_root_path
    click_link 'Offices'
    fill_in 'Street name', with: 'Briarcliff'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'

    expect(page).not_to have_content('BRIARCLIFF RD#4805')
    expect(page).to have_content('CHILDRENS HEALTHCARE')
  end

  describe 'Access Control' do
    it 'shows up as a link when you can access it' do
      login_as user
      visit insider_search_root_path
      expect(page).to have_link('Offices')
    end

    it "doesn't show up as a link when you can't access it" do
      user.settings.update!(offshop: false)

      login_as user
      visit insider_search_root_path
      expect(page).not_to have_link('Offices')
    end

    it 'allows users with offshop access' do
      login_as user
      visit insider_search_offices_path
      expect(page.current_path).to eql(insider_search_offices_path)
    end

    it 'denies users without offshop access' do
      user.settings.update!(offshop: false)

      login_as user
      visit insider_search_offices_path
      expect(page).to have_content('You do not have permission to view that page.')
      expect(page.current_path).to eql(insider_search_root_path)
    end

    it 'requires login' do
      visit insider_search_offices_path
      expect(page).to have_content('You must be logged in to access that page.')
      expect(page.current_path).to eql(insider_login_path)
    end
  end

end
