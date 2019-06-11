require "rails_helper"

feature "Search -> Industrial " do
  include LoginSupport

  let!(:industrial)  { FactoryGirl.create(:industrial) }
  let!(:industrial2) { FactoryGirl.create(:industrial2) }

  it 'allows you to search and view a record' do
    login_as user
    visit insider_search_root_path
    click_link 'Industrial'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'
    click_link '1DUQUESNE DR#6170'

    expect(page).to have_content('1DUQUESNE DR#6170')
    expect(page).to have_content('BROKERED 9/16/16')
    expect(page).to have_content('$2,677,065')
    expect(page).to have_content('BONDED INDUSTRIAL PROPERTIES/BON')
  end

  it 'allows you to search and select multiple records to view' do
    login_as user
    visit insider_search_root_path
    click_link 'Industrial'
    fill_in 'City', with: 'Atlanta'
    click_button 'Submit'

    check "select_result_#{industrial.id}"
    check "select_result_#{industrial2.id}"
    click_button 'Submit'

    expect(page).to have_content('1DUQUESNE DR#6170')
    expect(page).to have_content('1FULTON IND BLV#5060')
  end

  it "doesn't break when not entering any search criteria" do
    login_as user
    visit insider_search_root_path
    click_link 'Industrial'
    click_button 'Submit'

    expect(page).to have_link('1DUQUESNE DR#6170')
  end

  describe 'Access Control' do
    it 'shows up as a link when you can access it' do
      login_as user
      visit insider_search_root_path
      expect(page).to have_link('Industrial')
    end

    it "doesn't show up as a link when you can't access it" do
      user.settings.update!(industrial: false)

      login_as user
      visit insider_search_root_path
      expect(page).not_to have_link('Industrial')
    end

    it 'allows users with industrial access' do
      login_as user
      visit insider_search_industrial_index_path
      expect(page.current_path).to eql(insider_search_industrial_index_path)
    end

    it 'denies users without industrial access' do
      user.settings.update!(industrial: false)

      login_as user
      visit insider_search_industrial_index_path
      expect(page).to have_content('You do not have permission to view that page.')
      expect(page.current_path).to eql(insider_search_root_path)
    end

    it 'requires login' do
      visit insider_search_industrial_index_path
      expect(page).to have_content('You must be logged in to access that page.')
      expect(page.current_path).to eql(insider_login_path)
    end
  end

end
