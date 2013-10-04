class Course < ActiveRecord::Base
   attr_accessible :name

   has_many :enrollments,
            :class_name => "Enrollment",
            :primary_key => :id,
            :foreign_key => :course_id

  has_many :enrolled_students, :through => :enrollments, :source => :student


  # prerequisites
  belongs_to :prerequisite,
             :class_name => "Course",
             :primary_key => :id,
             :foreign_key => :prerequisite_id

  belongs_to :instructor,
             :class_name => "User",
             :primary_key => :id,
             :foreign_key => :instructor_id
end
