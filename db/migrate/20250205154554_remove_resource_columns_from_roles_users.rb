class RemoveResourceColumnsFromRolesUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :roles_users, :resource_type, :string
    remove_column :roles_users, :resource_id, :integer
  end
end
