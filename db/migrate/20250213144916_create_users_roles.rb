class CreateUsersRoles < ActiveRecord::Migration[8.0]
  def change
    create_table(:users_roles, :id => false) do |t| # id => false is non-negotiable
      t.references :user
      t.references :role
    end

    add_index :users_roles, [:user_id, :role_id] # Critical for performance
  end
end
