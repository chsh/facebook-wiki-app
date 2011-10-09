class CreatePageApps < ActiveRecord::Migration
  def change
    create_table :page_apps do |t|
      t.integer :page_id
      t.integer :app_id
      t.timestamps
    end
    add_index :page_apps, [:page_id, :app_id], unique: true
  end
end
