class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :body, presence: true
  validates :body, length: { maximum: 140 }
end
