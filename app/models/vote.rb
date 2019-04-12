# Perfomed by a user on a task
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :value, presence: true
end
