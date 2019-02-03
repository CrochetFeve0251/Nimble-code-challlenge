class StudentCompagnion < ActiveRecord::Base
    # Attributes: student_number
     belongs_to :student, inverse_of: :companion
     
     validates :student_number, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }
     
end