# Defined action available to users
class Task < ApplicationRecord
  validates :price, presence: true,
                    numericality: { greater_than: 0, only_integer: true }
  validates :title, presence: true
end
