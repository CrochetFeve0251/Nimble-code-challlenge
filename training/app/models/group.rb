class Group < ActiveRecord::Base
    has_and_belongs_to_many :students, class_name: "Student"
    belongs_to :course, class_name: "Course"
end
