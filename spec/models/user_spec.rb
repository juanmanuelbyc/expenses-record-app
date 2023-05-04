require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'juan', email: 'juan@test.com', password: '123456') }

  before { subject.save }

  it 'Name should match' do
    expect(subject.name).to eq('juan')
  end

  it 'Test that email cant be null' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'Password is present' do
    expect(subject.password).to_not be_nil
  end

  it 'Should test the length of the name' do
    subject.name = 'x' * 99
    expect(subject).to_not be_valid
  end
end
