# Action to be made by user
class Activity < ApplicationRecord
  belongs_to :user
  has_one :task

  validate :validate_complete_value

  scope :incompleted, -> { where(complete: false) }

  private

  def validate_complete_value
    return unless complete.nil?

    errors.add(:complete, 'can not be nil')
  end
end
