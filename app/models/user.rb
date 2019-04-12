# Facebook user
class User < ApplicationRecord
  include Clearance::User

  has_many :activities
  has_many :transactions

  validates :name, presence: true, uniqueness: true
end
