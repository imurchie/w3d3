class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :prerequisite_id
      t.integer :instructor_id

      t.timestamps
    end
  end
end
