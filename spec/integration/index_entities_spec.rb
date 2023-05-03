require 'rails_helper'
module WardenTestHelpers
  include Warden::Test::Helpers
end

RSpec.describe 'expenses/index.html.erb', type: :feature do
  include WardenTestHelpers
  before(:each) do
    @user = User.create!(name: 'juan', email: 'juan@test.com', password: '123456')
    @group = Group.create!(name: 'group', user_id: @user.id)
    @entity = Entity.create!(name: 'entity1', amount: 123, user_id: @user.id, group_id: @group.id)
    @entity = Entity.create!(name: 'entity2', amount: 456, user_id: @user.id, group_id: @group.id)
  end

  it 'should display page name' do
    login_as(@user, scope: :user)
    visit group_entities_path(@group.id)
    expect(page).to have_content('TRANSACTIONS')
  end

  it 'displays the list of entities' do
    login_as(@user, scope: :user)
    visit group_entities_path(@group)

    @entities = @group.entities.order(created_at: :desc)
    @entities.each do |entity|
      expect(page).to have_content(entity.name.to_s)
      expect(page).to have_content("$ #{entity.amount}")
    end
  end

  it 'has a button to add a new transaction' do
    login_as(@user, scope: :user)
    visit group_entities_path(@group)

    expect(page).to have_button('ADD NEW TRANSACTION')
  end
end
