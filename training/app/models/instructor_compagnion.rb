class InstructorCompagnion < ActiveRecord::Base
    # Attributes: student_id
     belongs_to :instructor, inverse_of: :companion
     validates :departement_name, presence: true
     
     validates :instructor_id, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }
     
end