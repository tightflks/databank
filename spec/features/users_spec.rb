require "rails_helper"

feature "Users" do
  include LoginSupport

  let!(:user) { FactoryGirl.create(:user, username: 'dan', first_name: 'Dan', last_name: 'Cunning', password: 'asdf', is_superuser: true) }
  let!(:tareq) { FactoryGirl.create(:user, username: 'tareq', email: 'tareq@topdan.com', password: 'asdf') }

  it "doesn't show in the sidebar for non-superusers" do
    user.update!(is_superuser: false)

    login_as user
    expect(page).not_to have_link('Users')
  end

  it 'shows a list of users for superusers' do
    login_as user
    click_link 'Users'
    expect(page).to have_content('Dan Cunning')
  end

  it 'sorts without erroring' do
    login_as user
    visit users_path(sort_by: 'username')
    expect(page).to have_content('Dan Cunning')

    visit users_path(sort_by: 'name')
    expect(page).to have_content('Dan Cunning')

    visit users_path(sort_by: 'email')
    expect(page).to have_content('Dan Cunning')

    visit users_path(sort_by: 'company')
    expect(page).to have_content('Dan Cunning')

    visit users_path(sort_by: 'invalid', sort_order: 'invalid2')
    expect(page).to have_content('Dan Cunning')
  end

  it 'allows superusers to create users' do
    login_as user
    click_link 'Users'
    click_link 'New User'
    fill_in 'Username', with: 'dcunning'
    fill_in 'Password', with: 'asdfasdf'
    click_button 'Create user'
    expect(page).to have_content('User created')
    expect(page).to have_content('dcunning')

    click_link 'Log out'
    fill_in 'Username', with: 'dcunning'
    fill_in 'Password', with: 'asdfasdf'
    click_button 'Login'
    expect(page).to have_content('Login successful! Welcome!')

  end

  it 'fails gracefully on create' do
    login_as user
    click_link 'Users'
    click_link 'New User'
    click_button 'Create user'
    expect(page).to have_content("Could not create user: Username can't be blank")
  end

  it 'allows superusers to update a user' do
    login_as user
    click_link 'Users'
    within "#user-#{tareq.id}" do
      click_link 'Edit User'
    end
    fill_in 'Username', with: 'tareq2'
    click_button 'Update user'
    expect(page).to have_content('User updated')
    expect(page).to have_content('tareq2')
    expect(tareq.reload.username).to eql('tareq2')
  end

  it 'fails gracefully on update' do
    login_as user
    visit edit_user_path(tareq)
    fill_in 'Username', with: ''
    click_button 'Update user'
    expect(page).to have_content("Could not update user: Username can't be blank")
  end

  it 'allows superusers to update a user password' do
    login_as user
    visit edit_user_path(tareq)
    fill_in 'Password', with: '56789'
    click_button 'Update user'
    expect(page).to have_content('User updated')

    click_link 'Log out'
    expect(page).to have_content('Logout successful')

    fill_in 'Username', with: 'tareq'
    fill_in 'Password', with: '56789'
    click_button 'Login'
    expect(page).to have_content('Login successful')
  end

  it 'does not update password unless the password field is filled in' do
    login_as user
    visit edit_user_path(tareq)
    fill_in 'Username', with: 'tareq2'
    click_button 'Update user'
    expect(page).to have_content('User updated')

    click_link 'Log out'
    expect(page).to have_content('Logout successful')

    fill_in 'Username', with: 'tareq2'
    fill_in 'Password', with: 'asdf'
    click_button 'Login'
    expect(page).to have_content('Login successful')
  end

  it 'allows superusers to delete users' do
    login_as user
    click_link 'Users'
    within "#user-#{tareq.id}" do
      click_link 'Delete User'
    end
    expect(page).to have_content('User deleted')
    expect(User.where(id: tareq).first).to eql(nil)
  end

end
