class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :Project_name
      t.text :Project_description

      t.timestamps
    end
  end
end
