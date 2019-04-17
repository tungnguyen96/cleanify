# Action to be made by user
class Activity < ApplicationRecord
  belongs_to :user
  has_one :task

  validate :validate_complete_value

  scope :not_completed, -> { where(complete: false) }

  private

  def validate_complete_value
    return unless complete.nil?
    errors.add(:complete, "must be false or true")
  end
end
