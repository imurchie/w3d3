class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_topic_id, :null => false
      t.integer :tagged_url_id, :null => false
      t.timestamps
    end
    add_index :taggings, [:tag_topic_id, :tagged_url_id], :unique => true
  end
end
