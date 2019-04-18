require 'rails_helper'

RSpec.describe API::Users do

  context 'GET /api/users/:identifier' do
    let(:user) { User.new(name: 'foo', email: 'foo@mail.com') }

    it 'returns an user by id' do
      user.save
      get "/api/users/#{user.id}"

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq({'id' => user.id,
                                              'name' => user.name,
                                              'email' => user.email})
    end
  
    it 'returns an user by name' do
      user.save
      get "/api/users/#{user.name}"

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq({'id' => user.id,
                                              'name' => user.name,
                                              'email' => user.email})
    end
  
    it 'returns not found if user not exist' do
      get "/api/users/#{user.name}"

      result = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(result.fetch('status')).to eq(404)
      expect(result.fetch('result')).to eq('user does not exist')
    end
  end

  context 'GET /api/users' do
    it 'returns a list of users' do
      user_foo = User.create!(name: 'foo', email: 'foo@mail.com')
      user_bar = User.create!(name: 'bar', email: 'bar@mail.com')
      get '/api/users'

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq([
        {'id' => user_foo.id,
         'name' => user_foo.name,
         'email' => user_foo.email},
        {'id' => user_bar.id,
         'name' => user_bar.name,
         'email' => user_bar.email}
      ])
    end

    it 'returns empty array if no users' do
      get '/api/tasks'

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq([])
    end
  end
end
