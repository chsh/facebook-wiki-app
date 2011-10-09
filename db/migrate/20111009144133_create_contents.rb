class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :ownable_id
      t.string :ownable_type
      t.text :content
      t.timestamps
    end
    add_index :contents, [:ownable_id, :ownable_type], unique: true
  end
end
