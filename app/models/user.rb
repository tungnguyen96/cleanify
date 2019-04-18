# Facebook user
class User < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :activities
  has_many :transactions

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: EMAIL_REGEX }

  scope :by_identifier, lambda { |identifier|
    where(id: identifier.to_i).or(User.where(name: identifier.to_s))
  }

  def to_hash
    { 'id': id,
      'name': name,
      'email': email }
  end
end
