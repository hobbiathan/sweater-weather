class User < ApplicationRecord
  validates_uniqueness_of :email
  validates_presence_of :email

  has_secure_password

  before_validation :set_key

  def set_key
    self.api_key = SecureRandom.hex.to_s
  end
end
