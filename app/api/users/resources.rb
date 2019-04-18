module Users
  # User CRUD
  class Resources < Grape::API

    namespace :users do

      get '' do
        result = User.all.map(&:to_hash)
        {'status': 200, 'result': result}
      end

      get ':identifier' do
        user = User.by_identifier(params[:identifier]).first
        if user
          {'status': 200, 'result': user.to_hash}
        else
          status 404
          {'status': 404, 'result': 'user does not exist'}
        end
      end
    end
  end
end
