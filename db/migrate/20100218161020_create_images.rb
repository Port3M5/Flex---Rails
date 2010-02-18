class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      
      t.string :title, :null => false
      t.string :url, :null => false
      t.integer :category_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
