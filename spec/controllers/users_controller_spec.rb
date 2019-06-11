require 'rails_helper'

RSpec.describe UsersController do
  include LoginSupport

  # The UI doesn't expose a way for the user to perform these actions so
  # feature tests are not able to spec it out but backend security
  # is always worth testing.

  let(:user2) { FactoryGirl.create(:user, username: 'tareq', password: 'asdf', email: 'tareq@topdan.com') }

  it 'blocks non-superusers from creating users' do
    login_as user
    post :create, params: {user: {email: 'dan@topdan.com'}}
    expect(flash[:alert]).to eql('You do not have permission to view that page.')
  end

  it 'blocks non-superusers from updating users' do
    login_as user
    put :update, params: {id: user2.id, user: {email: 'dan@topdan.com'}}
    expect(flash[:alert]).to eql('You do not have permission to view that page.')
  end

  it 'blocks non-superusers from deleting users' do
    login_as user
    delete :destroy, params: {id: user2.id}
    expect(flash[:alert]).to eql('You do not have permission to view that page.')
  end

  it 'blocks superusers from deleting themselves' do
    user.update!(is_superuser: true)

    login_as user
    delete :destroy, params: {id: user.id}
    expect(flash[:alert]).to eql('You do not have permission to view that page.')
  end

end
