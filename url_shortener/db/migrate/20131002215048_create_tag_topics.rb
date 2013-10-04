class CreateTagTopics < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :name, :null => false
      t.timestamps
    end
    add_index :tag_topics, [:name], :unique => true
  end
end
