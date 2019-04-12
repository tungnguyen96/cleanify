require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'must have a value' do
    expect(Vote.new).not_to be_valid
  end
end
