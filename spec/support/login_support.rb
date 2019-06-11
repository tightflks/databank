module LoginSupport

  def self.included(base)
    base.class_eval do
      let(:user) { FactoryGirl.create(:user, username: 'dan', password: 'asdf') }
    end
  end

  def login_as(user, password: 'asdf')
    if respond_to?(:visit)
      visit insider_login_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: password
      click_button 'Login'

      expect(page).to have_content('Login successful! Welcome!')
    else
      session[:user_id] = user.id # TODO this should have more protection on it
    end
  end

end
