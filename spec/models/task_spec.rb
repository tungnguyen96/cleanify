require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { Task.new(price: 10, title: 'clean') }

  it 'must have price' do
    task.price = nil
    expect(task).not_to be_valid
  end

  it 'must have title' do
    task.title = nil
    expect(task).not_to be_valid
  end

  it 'price must be number' do
    task.price = 'a'
    expect(task).not_to be_valid
  end

  it 'price cannot be negative' do
    task.price = -1
    expect(task).not_to be_valid
  end

  it 'price must be integer' do
    task.price = 1.1
    expect(task).not_to be_valid
  end
end
