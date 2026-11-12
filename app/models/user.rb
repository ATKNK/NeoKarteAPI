class User < ApplicationRecord
  has_secure_password

  before_validation :normalize_email_address

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }

  private

  def normalize_email_address
    self.email_address = email_address.strip.downcase if email_address.present?
  end
end
