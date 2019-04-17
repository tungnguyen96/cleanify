require 'rails_helper'

RSpec.describe API::Activities do

  context 'GET /api/activities' do
    it 'return list all not completed activities' do
      act_1 = Activity.new(id: 1, user_id: 1, task_id: 1, complete: false)
      act_2 = Activity.new(id: 2, user_id: 1, task_id: 2, complete: false)
      act_3 = Activity.new(id: 3, user_id: 2, task_id: 2, complete: true)
      allow(Activity).to receive(:not_completed).and_return([act_1, act_2])
      get '/api/activities'

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq([
        {'id' => act_1.id,
         'user_id' => act_1.user_id,
         'task_id' => act_1.task_id,
         'complete' => act_1.complete},
        {'id' => act_2.id,
         'user_id' => act_2.user_id,
         'task_id' => act_2.task_id,
         'complete' => act_2.complete}
        ])
    end

    it 'return empty array if no activity' do
      allow(Activity).to receive(:not_completed).and_return([])
      get '/api/activities'

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq([])
    end
  end

  context 'GET /api/activities/:id' do
    it 'return a activities by id' do
      activity = Activity.new(id: 1, user_id: 1, task_id: 1, complete: false)
      allow(Activity).to receive(:find).and_return(activity)
      get "/api/activities/#{activity.id}"

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq({'id' => activity.id,
                                            'user_id' => activity.user_id,
                                            'task_id' => activity.task_id,
                                            'complete' => activity.complete})
    end

    it 'return not found if activity with id not exist' do
      allow(Activity).to receive(:find).and_return(nil)
      get '/api/activities/1'

      result = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(result.fetch('status')).to eq(404)
      expect(result.fetch('result')).to eq('activity is not exist.')
    end
  end
end
