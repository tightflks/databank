require "rails_helper"

feature "Search -> Franchise" do
  include LoginSupport

  let!(:franchise) { FactoryGirl.create(:franchise) }
  let!(:franchise2) { FactoryGirl.create(:franchise2) }

  it 'allows you to search and view a record' do
    login_as user
    visit insider_search_root_path
    click_link 'Franchise'
    fill_in 'Street name', with: 'Briarcliff'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'
    click_link "WALGREEN'S"

    expect(page).to have_content("WALGREEN'S")
    expect(page).to have_content('THIS IS THE 8/26/2008 SALE')
    expect(page).to have_content('$3,825,000')
    expect(page).to have_content('PARADISE DEVELOPMENT')
  end

  it 'allows you to search and select multiple records to view' do
    login_as user
    visit insider_search_root_path
    click_link 'Franchise'
    fill_in 'Street name', with: 'Briarcliff'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'

    check "select_result_#{franchise.id}"
    check "select_result_#{franchise2.id}"
    click_button 'Submit'

    expect(page).to have_content("WALGREEN'S")
    expect(page).to have_content('BRIARCLIFF RD#2566')
  end

  it "doesn't break when not entering any search criteria" do
    login_as user
    visit insider_search_root_path
    click_link 'Franchise'
    click_button 'Submit'

    expect(page).to have_link('BRIARCLIFF RD#2566')
  end

  describe 'Access Control' do
    it 'shows up as a link when you can access it' do
      login_as user
      visit insider_search_root_path
      expect(page).to have_link('Franchise')
    end

    it "doesn't show up as a link when you can't access it" do
      user.settings.update!(franchise: false)

      login_as user
      visit insider_search_root_path
      expect(page).not_to have_link('Franchise')
    end

    it 'allows users with franchise access' do
      login_as user
      visit insider_search_franchise_index_path
      expect(page.current_path).to eql(insider_search_franchise_index_path)
    end

    it 'denies users without franchise access' do
      user.settings.update!(franchise: false)

      login_as user
      visit insider_search_franchise_index_path
      expect(page).to have_content('You do not have permission to view that page.')
      expect(page.current_path).to eql(insider_search_root_path)
    end

    it 'requires login' do
      visit insider_search_franchise_index_path
      expect(page).to have_content('You must be logged in to access that page.')
      expect(page.current_path).to eql(insider_login_path)
    end
  end

end
