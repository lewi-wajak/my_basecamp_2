class AddResourceColumnsToRoles < ActiveRecord::Migration[8.0]
  def change
    add_column :roles, :resource_type, :string 
    add_column :roles, :resource_id, :bigint 

    add_index :roles, [:name, :resource_type, :resource_id], name: "index_roles_on_name_and_resource" 

  end
end
