class Tweet < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }
  has_many :comments
  has_and_belongs_to_many :tags
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size

  private
  #validates the size of an uploader picture
  def picture_size
    if picture.size > 2.megabytes
      errors.add(:picture, "should be less than 2MB")
    end
  end

end
