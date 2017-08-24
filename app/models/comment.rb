class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :content, presence: true
  validates :user_id, presence: true
  validates :video_id, presence: true
end
