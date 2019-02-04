class Course < ActiveRecord::Base
    # Attributes: subject, lastname, citizen_id, login, password
    belongs_to :instructor, class_name: "Instructor"
    has_and_belongs_to_many :persons, class_name: "Person"
    validates :subject, presence: true
    validates :instructor, presence: true

end