# Action to be made by user
class Activity < ApplicationRecord
  belongs_to :user
  has_one :task

  validates :complete, presence: true

  after_initialize { self.complete = false }
end
