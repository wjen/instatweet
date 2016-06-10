class Tweet < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments
  has_and_belongs_to_many :tags
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
