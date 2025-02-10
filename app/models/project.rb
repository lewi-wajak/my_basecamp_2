class Project < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  
  # Associating the project with multiple users (members)
  has_many :project_users
  has_many :users, through: :project_users

  has_many :project_threads, dependent: :destroy


  # Attachments for the project using ActiveStorage
  has_many_attached :attachments
end