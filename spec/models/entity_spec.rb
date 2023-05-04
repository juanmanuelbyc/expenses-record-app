require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.new(name: 'juan', email: 'juan@test.com', password: '123456')

    @entity = Entity.new(name: 'entity', user_id: @user.id, amount: 123)
  end

  it 'name should be present' do
    @entity.name = ' '
    expect(@entity).not_to be_valid
  end

  it 'amount should be present' do
    @entity.amount = ''
    expect(@entity).not_to be_valid
  end
end
