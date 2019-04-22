require 'rails_helper'

RSpec.describe API::Healths do
  
  context 'GET /api/heath_check' do
    it 'returns status success' do
      get '/api/health_check'
      expect(response.status).to eq(200)
    end
  end
end
