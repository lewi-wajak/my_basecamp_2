class CreateRolesUsersJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :users, :roles do |t|
      # Indexes to speed up lookups
      t.index :user_id
      t.index :role_id
    end
  end
end
