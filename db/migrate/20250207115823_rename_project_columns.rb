class RenameProjectColumns < ActiveRecord::Migration[8.0]
  def change
    rename_column :projects, :Project_name, :project_name
    rename_column :projects, :Project_description, :project_description
  end

end
