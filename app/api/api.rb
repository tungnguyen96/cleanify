# Mount point for APIs
class API < Grape::API
  format :json
  prefix '/api'

  mount Tasks::Resources
end
