require 'rails_helper'

RSpec.describe API::Activities do

  context 'GET /api/activities' do
    it 'return list all incompleted activities' do
      user = User.create!(name: "tung", email: "tung@gmail.com")
      task = Task.create!(title: "test", price: 10)
      incompleted_act = Activity.create!(user_id: user.id,
                               task_id: task.id,
                               complete: false)
      act_2 = Activity.create!(user_id: user.id,
                               task_id: task.id,
                               complete: true)
      get '/api/activities'

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result').size).to eq(1)
      expect(result.fetch('result')).to eq([
        {'id' => incompleted_act.id,
         'user_id' => incompleted_act.user_id,
         'task_id' => incompleted_act.task_id,
         'complete' => incompleted_act.complete}
        ])
    end

    it 'return empty array if no activity' do
      allow(Activity).to receive(:incompleted).and_return([])
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
