# Mount point for APIs
class API < Grape::API
  format :json
  prefix '/api'

  mount Tasks::Resources
  mount Activities::Resources
  mount Users::Resources
  mount Healths::Resources
end
