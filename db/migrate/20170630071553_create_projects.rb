class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
