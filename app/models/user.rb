# Facebook user
class User < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :activities
  has_many :transactions

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
                    format: {with: EMAIL_REGEX}
end
