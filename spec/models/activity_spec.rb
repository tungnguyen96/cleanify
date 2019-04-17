require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:activity) { Activity.new(complete: false) }

  it 'must have complete' do
    activity.complete = nil
    expect(activity).not_to be_valid
  end

  it 'incompleted as default' do
    expect(Activity.new).not_to be_complete
  end

  it 'complete must be true or false' do
    activity.complete = ''
    expect(activity).not_to be_valid
  end
end
