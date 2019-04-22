module Healths
  # Lightweight pingable endpoint for refreshing dyno
  class Resources < Grape::API
    get 'health_check' do
    end
  end
end
