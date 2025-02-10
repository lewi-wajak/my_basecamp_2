class RenameThreadsToProjectThreads < ActiveRecord::Migration[8.0]
  def change
    rename_table :threads, :project_threads
  end
end
