module Tasks
  # Task CRUD
  class Resources < Grape::API

    namespace :tasks do

      get '' do
        {'status': 200, 'result': Task.all}
      end

      get ':id' do
        task = Task.find(params[:id])
        if task.present?
          {'status': 200, 'result': task}
        else
          status 404
          {'status': 404, 'result': 'task is not exist.'}
        end
      end
    end
  end
end
