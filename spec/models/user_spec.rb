require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(email: 'foo@mail.com', name: 'bar')
  end

  it 'name must be unique' do
    dup_user = user.dup
    user.email = 'bar@mail.com'
    user.save
    expect(dup_user).not_to be_valid
  end

  it 'name must exist' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'email must be unique' do
    dup_user = user.dup
    dup_user.name = 'foo'
    user.save
    expect(dup_user).not_to be_valid
  end

  it 'email must exist' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'email must be in email format' do
    user.email = 'aaaaaaaaa'
    expect(user).not_to be_valid
  end
end
