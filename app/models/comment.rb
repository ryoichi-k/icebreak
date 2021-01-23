class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :icebreak, optional: true
  validates :user_id, presence: true
end
