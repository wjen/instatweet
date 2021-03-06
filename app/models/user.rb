class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 6}, allow_blank: true
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /[\w+\-.]+@[a-z\.]+\.[a-z]+/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }


  has_many :tweets, dependent: :destroy
  has_many :comments
  before_save :set_handle

  def feed
    Tweet.where("user_id = ?", id)
  end

  private

  def set_handle
    self.handle ||= email
  end


end


