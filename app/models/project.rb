class Project < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  
 
  has_many :project_users
  has_many :users, through: :project_users

  has_many :project_threads, dependent: :destroy
  has_many_attached :attachments
end