class User < ActiveRecord::Base
  has_secure_password
  before_create { generate_token(:auth_token) }
  before_create { generate_api_key }

  validates :password, :password_confirmation, presence: true
  validates :password, length: { in: 6..20 }
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  def generate_api_key
    self.api_key = Digest::MD5.hexdigest("antinoteapi#{self.password_digest}")
  end
end
