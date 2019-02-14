class Course < ActiveRecord::Base
    # Attributes: subject, lastname, citizen_id, login, password
    belongs_to :instructor, class_name: "Instructor"
    has_and_belongs_to_many :students, class_name: "Student"
    has_many :groups, class_name: "Group"
    validates :subject, presence: true
    validates :instructor, presence: true

end