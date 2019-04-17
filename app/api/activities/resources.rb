module Activities
  # Activity CRUD
  class Resources < Grape::API
    namespace :activities do
      
      get '' do
        {'status': 200, 'result': Activity.not_completed}
      end

      get ':id' do
        activity = Activity.find(params[:id])
        if activity.present?
          {'status': 200, 'result': activity}
        else
          status 404
          {'status': 404, 'result': 'activity is not exist.'}
        end
      end
    end
  end
end
