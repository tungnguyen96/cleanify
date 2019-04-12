# Money income - outcome history
class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :amount, presence: true, numericality: { only_integer: true }
  validates :complete, presence: true

  after_initialize { self.complete = false }
end
