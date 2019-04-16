require 'rails_helper'

RSpec.describe API::Tasks do

  context 'GET /api/tasks/:id' do
    it 'returns a task by id' do
      task = Task.new(id: 1, title: 'aa', price: 123)
      allow(Task).to receive(:find).and_return(task)
      get "/api/tasks/#{task.id}"

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq({'id' => task.id,
                                            'title' => task.title,
                                            'price' => task.price})
    end

    it 'return not found if task with id not exist' do
      allow(Task).to receive(:find).and_return(nil)
      get '/api/tasks/1'

      result = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(result.fetch('status')).to eq(404)
      expect(result.fetch('result')).to eq('task is not exist.')
    end
  end

  context 'GET /api/tasks' do
    it 'returns a list of tasks' do
      task_foo = Task.new(id: 1, title: 'foo', price: 100)
      task_bar = Task.new(id: 2, title: 'bar', price: 200)
      allow(Task).to receive(:all).and_return([task_foo, task_bar])
      get '/api/tasks'

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq([
        {'id' => task_foo.id,
         'title' => task_foo.title,
         'price' => task_foo.price},
        {'id' => task_bar.id,
         'title' => task_bar.title,
         'price' => task_bar.price}
      ])
    end

    it 'return empty array if no tasks' do
      allow(Task).to receive(:all).and_return([])
      get '/api/tasks'

      result = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(result.fetch('status')).to eq(200)
      expect(result.fetch('result')).to eq([])
    end
  end
end
