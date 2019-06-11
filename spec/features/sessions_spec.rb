require "rails_helper"

feature "Sessions" do
  include LoginSupport

  let!(:user) { FactoryGirl.create(:user, username: 'dan', password: 'asdf') }

  describe 'Login' do
    it 'successfully logs you in' do
      visit root_path
      fill_in 'Username', with: 'dan'
      fill_in 'Password', with: 'asdf'
      click_button 'Login'

      expect(page).to have_content('Login successful! Welcome!')
      expect(page.current_path).to eql(insider_search_root_path)
    end

    it 'fails with an invalid username' do
      visit root_path
      fill_in 'Username', with: 'wrong'
      fill_in 'Password', with: 'asdf'
      click_button 'Login'

      expect(page).to have_content('Your username or password were invalid.')
      expect(page.current_path).to eql(insider_login_path)
    end

    it 'fails with an invalid password' do
      visit root_path
      fill_in 'Username', with: 'dan'
      fill_in 'Password', with: 'wrong'
      click_button 'Login'

      expect(page).to have_content('Your username or password were invalid.')
      expect(page.current_path).to eql(insider_login_path)
    end

    it 'fails when the user is inactive' do
      user.update!(is_active: false)

      visit root_path
      fill_in 'Username', with: 'dan'
      fill_in 'Password', with: 'asdf'
      click_button 'Login'

      expect(page).to have_content("Your user isn't active.")
      expect(page.current_path).to eql(insider_login_path)
    end
  end

  describe 'Logout' do
    it 'successfully logs you out' do
      login_as user
      click_link 'Log out'
      expect(page).to have_content('Logout successful!')
      expect(page.current_path).to eql(insider_login_path)
    end

    it 'automatically logs out inactive users' do
      login_as user
      user.update!(is_active: false)

      visit root_path
      expect(page).to have_content('Your user has been marked inactive')
      expect(page.current_path).to eql(insider_login_path)
    end
  end

end
