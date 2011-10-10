class CreateContentPages < ActiveRecord::Migration
  def change
    create_table :content_pages do |t|
      t.integer :content_id
      t.string :name
      t.text :text
      t.integer :format, default: 0
      t.timestamps
    end
    add_index :content_pages, [:content_id, :name], unique: true
  end
end
