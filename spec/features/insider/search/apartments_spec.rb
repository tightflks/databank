require "rails_helper"

feature "Search -> Apartments" do
  include LoginSupport

  let!(:apartment) { FactoryGirl.create(:apartment) }
  let!(:apartment2) { FactoryGirl.create(:apartment2) }

  it 'allows you to search and view a record' do
    login_as user
    visit insider_search_root_path
    click_link 'Apartments'
    fill_in 'Street name', with: 'Briarcliff'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'
    click_link 'EXECUTIVE PARK APTS'

    expect(page).to have_content('2580 BRIARCLIFF RD')
    expect(page).to have_content('IS THE 8/1/16 SALE')
    expect(page).to have_content('$6,900,000')
    expect(page).to have_content("CHILDRENS HEALTHCARE/CHILDREN'S HEALTHCARE O")
  end

  it 'allows you to search and select multiple records to view' do
    login_as user
    visit insider_search_root_path
    click_link 'Apartments'
    fill_in 'Street name', with: 'Briarcliff'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'

    check "select_result_#{apartment.id}"
    check "select_result_#{apartment2.id}"
    click_button 'Submit'

    expect(page).to have_content('2580 BRIARCLIFF RD')
    expect(page).to have_content('BELARA/WAS MARQUIS OF NORTH DRUID HILLS')
  end

  it 'displays number of units on the search form' do
    login_as user
    visit insider_search_apartments_path
    expect(page).to have_field('Number units start')
  end

  it "doesn't break when not entering any search criteria" do
    login_as user
    visit insider_search_root_path
    click_link 'Apartments'
    click_button 'Submit'

    expect(page).to have_link('EXECUTIVE PARK APTS')
  end

  describe 'Access Control' do
    it 'shows up as a link when you can access it' do
      login_as user
      visit insider_search_root_path
      expect(page).to have_link('Apartments')
    end

    it "doesn't show up as a link when you can't access it" do
      user.settings.update!(apartment: false)

      login_as user
      visit insider_search_root_path
      expect(page).not_to have_link('Apartments')
    end

    it 'allows users with apartments access' do
      login_as user
      visit insider_search_apartments_path
      expect(page.current_path).to eql(insider_search_apartments_path)
    end

    it 'denies users without apartments access' do
      user.settings.update!(apartment: false)

      login_as user
      visit insider_search_apartments_path
      expect(page).to have_content('You do not have permission to view that page.')
      expect(page.current_path).to eql(insider_search_root_path)
    end

    it 'requires login' do
      visit insider_search_apartments_path
      expect(page).to have_content('You must be logged in to access that page.')
      expect(page.current_path).to eql(insider_login_path)
    end
  end

end
