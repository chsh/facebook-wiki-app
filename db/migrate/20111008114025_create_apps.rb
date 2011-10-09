class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :app_id, null: false
      t.string :app_secret, null: false
      t.text :private_attrs
      t.text :public_attrs
      t.timestamps
    end
    add_index :apps, :app_id, unique: true
  end
end
