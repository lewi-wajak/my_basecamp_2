class Message < ApplicationRecord
  belongs_to :project_thread
  belongs_to :user

  validates :content, presence: true
end
