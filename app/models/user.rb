class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 6}
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /[\w+\-.]+@[a-z\.]+\.[a-z]+/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }



  before_save :set_handle

  private

  def set_handle
    self.handle ||= email
  end

end
