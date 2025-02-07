json.extract! thread, :id, :title, :project_id, :user_id, :created_at, :updated_at
json.url thread_url(thread, format: :json)
