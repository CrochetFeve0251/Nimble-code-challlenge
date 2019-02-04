class Person < ActiveRecord::Base
    # Attributes: firstname, lastname, citizen_id, login, password
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :citizen_id, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }
    validates :login, presence: true, uniqueness: true
    validates :password, presence:true
    has_and_belongs_to_many :courses, class_name: "Course"
end
