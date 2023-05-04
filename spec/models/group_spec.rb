require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.create!(name: 'juan', email: 'juan@test.com', password: '123456')
    Group.create!(name: 'First_group', user_id: @user.id)
  end

  before { subject.save }

  it 'Testing name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Co paring name lenght' do
    subject.name = 'x' * 99
    expect(subject).to_not be_valid
  end
end
