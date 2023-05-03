require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :feature do
  before(:each) do
    @user = User.create!(name: 'User', email: 'user@test.com', password: '123456')
    @group = Group.create!(name: 'Group', user_id: @user.id)
  end

  it 'should authenticate the user' do
    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    visit groups_path
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@group.name)
    expect(page).to have_content(@group.entities.sum(:amount))
    expect(page).to have_content('CATEGORIES')
    expect(page).to have_content('ADD NEW CATEGORY')
  end
end
